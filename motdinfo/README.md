This script can be called by your .bash_profile script to show Raspberry Pi 
information when logging in.

To install, login to your Raspberry Pi and issue the following commands:
"""
cd ~
wget https://raw.githubusercontent.com/vaxxi/rpi/master/motdinfo/motdinfo.sh
chmod +x motdinfo.sh
echo "`pwd`/motdinfo.sh" >> .bash_profile
"""

Sample output:

"""
 Raspberry Pi Model B	Released Q3 2012	PCB Rev. 2.0	256 MB	Sony 
================================================================================
 Welcome ! it's me, pi02 
 Uptime: 21:50:16 up 2 days, 2:48, 2 users, load average: 0.00, 0.05, 0.05 
 Memory: 159 MB out of 181 MB used ( 14 % free ) 
 Swap: not used 
 Interfaces: wlan0 192.168.1.29/24
================================================================================
"""