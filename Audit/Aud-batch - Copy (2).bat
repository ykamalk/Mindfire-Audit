set computername >> %computername%.txt
set n >> %computername%.txt
set processor >> %computername%.txt

regedit /e d:\mfs.txt hkey_local_machine\software\microsoft\windows\currentversion\uninstall
find /I "displayname" d:\mfs.txt >> %computername%.txt

regedit /e d:\mfs64.txt hkey_local_machine\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall
find /I "displayname" d:\mfs64.txt >> %computername%.txt

SYSTEMINFO | FIND /i "OS Name">>%computername%.txt
SYSTEMINFO | FIND /i "Install Date">>%computername%.txt
SYSTEMINFO | FIND /i "Product ID">>%computername%.txt
SYSTEMINFO | FIND /i "System Manufacturer">>%computername%.txt
SYSTEMINFO | FIND /i "System Model">>%computername%.txt
SYSTEMINFO | FIND /i "System type">>%computername%.txt
SYSTEMINFO | FIND /i "Processor(s)">>%computername%.txt

//del c:\mfs.txt
//del c:\mfs64.txt

wmic ntevent where "EventCode = 11724" >> %computername%.txt
wmic ntevent where "EventCode = 11728" >> %computername%.txt

// move %computername%.txt \\192.168.10.251\myshare\%computername%.txt

net stop sharedaccess