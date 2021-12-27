#!/usr/bin/env python
import sys,os,csv,time,wget
from datetime import date
from check_exception_conf import f,max_file_age,sheet,sheet_gid,tsv_check

debug=False
#debug=True

def fetch(pathname):
    url = "https://docs.google.com/spreadsheets/d/"+sheet+"/export?format=tsv&gid="+sheet_gid
    if debug: print ("* fetching "+url+" into "+pathname)
    try:
	os.remove(f)
    except OSError:
	pass
    wget.download(url, f, bar=None)

def file_age(pathname):
    return round((time.time() - os.path.getmtime(pathname)) / 60 / 60)

def check_tsv(pathname):
  with open(pathname) as tsv:
    line = next(csv.reader(tsv, delimiter="\t"))
    if line!=tsv_check:
      print("* Sheet error!")

if len(sys.argv)==2 and sys.argv[1]=="fetch":
    fetch(f)
    check_tsv(f)
    sys.exit(0)

if not os.path.exists(f): fetch(f)
if file_age(f)>max_file_age: fetch(f)

with open(f) as tsv:
  next(tsv)					# skipping the signature (control row)
  next(tsv)					# skipping the TSV header
  for line in csv.reader(tsv, delimiter="\t"):
    if line[2] == "": line[2] = line[1]		# if 'date-to' is not present then apply as 'date-from'
    rawfrom = line[1].split(".")
    rawto = line[2].split(".")

    # converting from "D.M." string to (M,D) ... adjust to your locales!
    datefrom = (int(rawfrom[1]), int(rawfrom[0]))
    dateto = (int(rawto[1]), int(rawto[0]))
    today = (int(date.today().strftime("%-m")), int(date.today().strftime("%-d")))

    if datefrom <= today <= dateto:
        if debug:
            print("today: ")
            print(today)
            print("exception found:")
            print(datefrom)
            print(dateto)
        sys.exit(-1)

sys.exit(0)
