# UAP-AC-EDU for a schoolbell and PA system - how to fix it with Asterisk!

... because my [Story on UI Community](https://community.ui.com/stories/UAP-AC-EDU-for-a-schoolbell-and-PA-system-how-to-fix-it-with-Asterisk/865fe9c0-4caf-4885-aeac-74abfd56dbe3) will forever wait for approval or be banned ...

## Introduction I - It was a hell of a ride...
It was summer 2017 and I've deployed 35 EDU units in several objects of a high school in Olomouc, Czech Republic. Lately that year I began to suspect this product is going to EOL very soon. At first, our distributor has discarded this product and since the deployment, we suffered from terrible issues.

Where was the trouble? Streams got stuck all the time. It wasn't designed as a multicast stream IMHO and when a single stream got stuck system wasn't able to play the next scheduled sounds until I manually terminated the frozen stream.

Early after the deployment, we found that UC-CK is too weak (or unoptimized) for this kind of application and amount of devices. So I've moved the Controller to a dedicated server and with a system scheduler, I was restarting the Controller (service) several times a day to eventually release the stuck streams.

What about the mobile app? I didn't like the Android EDU app from the beginning, I've chatted with programmers, they were aware of some bugs but the UniFi app has a higher priority.

The only hope and the solution suggested by Jeff from Ubiquiti was switching EDUs to SIP and my own PBX.

Btw. another story was about creating the custom housing (3D printed mounting console and sheet metal collar) for the speaker because the school has old buildings and all units are mounted under the ceiling (not into).

![image](https://user-images.githubusercontent.com/2069874/151969667-faf6affb-cf61-4344-b3f0-4e54eb4a9d39.png)
![image](https://user-images.githubusercontent.com/2069874/151970878-a880441d-ca5e-4181-b610-a2a6723f4fa3.png)


## Introduction II - The new era: PA over SIP
As Ubiquiti support suggested FreePBX, I found out immediately that FreePBX is overkill with too much bloat. I've never worked with Asterix nor FreePBX so learning pure Asterisk is a better option then. TLDR: don't go with FreePBX/whateverPBX ... Asterisk implementation needs just a few files and lines of configuration.

UAP-AC-EDU is using baresip for SIP function but from Ubiquiti design, just a crappy A-law is possible so forgot about any nice music. Because EDUs are no longer supported (no future firmware versions) it is probably still possible to build (cross-compile) and provide Opus (successor to Vorbis) codec files and put them into the units but this is not my use case anymore (I've tried once, run into some issues -don't remember details- and because units received new firmware very often these days, I gave it up).

So let's make this whole thing running and playing... (see [README.md](README.md))
