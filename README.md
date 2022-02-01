# UniFi-EDU-schoolbell
Schoolbell/PA system backend for UniFi-AC-EDU

`<TLDR>`[Story behind this...](story.md)`</TLDR>`

## Requirements
- Linux machine/VM/container or Raspberry Pi (version 4 recommended, also with PoE hat)
- Asterisk
- UniFi Controller (mine is running on the same system, not required)
- EDUs
- G.711 A-law 8-bit, 8kHz, 1 channel audio files (try [Jamendo Music](https://www.jamendo.com/start) for some tunes and respect their CC licenses)
- this repo

## Setup
- Adjust the configuration files:
  - `/etc/asterisk/extensions.conf` (advanced configuration for PA system)
  - `/etc/asterisk/pjsip.conf` (extensions for EDUs)
  - `/opt/schoolbell/check_exception_conf.py` (spreadsheet id, see below)
  - `/opt/schoolbell/check_registrations.sh` (e-mail setup)
  - edit your Crontab (example in `/opt/schoolbell/examples`) (times, audio files and groups) 
- Clone this [example spreadsheet](https://docs.google.com/spreadsheets/d/1tC2X387uksqD6kVU7SRej_NDeK-QRlmhKxR8RmPudho) with exceptions from ringing the schoolbell (holidays, etc.)
- Put your `.alaw` files into `/usr/local/share/asterisk/sounds` (there is a converting helper in `/opt/schoolbell/examples`)
- In your UniFi Controller, create SIP endpoints regarding to `pjsip.conf`
  - former versions: Settings > Services > SIP
  - new versions: Settings > Advanced Features > Advanced Gateway Settings > SIP (or just simply use search function)

## SIP softclient (Windows)
- [tSIP](http://tomeko.net/software/SIPclient/) is highly customizable and recommended solution for creating UI for PA.
  - Example of my implementation:
    
    ![image](https://user-images.githubusercontent.com/2069874/147472814-ace63570-d094-4bcf-9b72-fa2cd465dc08.png)
  - You can bundle your implementation into the installer with [Inno Setup](https://jrsoftware.org/isinfo.php)

## Plans for the future
- [ ] adjust `/etc/asterisk/modules.conf` for loading just required modules without any bloat (probably will newer do) 
- [ ] replace tSIP with [SIP.js](https://sipjs.com)
- [ ] turn those scripts into the docker (probably will newer do) 

## Notes
- My implementation also contains lighttpd providing the user's manual pages with tSIP installer, update system for its configs and some backend health-check scripts, here I want to put my future SIP.js tool 
