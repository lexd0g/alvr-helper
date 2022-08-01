# ALVR Helper
PowerShell script to download and extract the ALVR server, and download and install the client through ADB. By default it downloads the nightly version, Windows server and Oculus Quest client, but you can modify this by editing the variables at the beginning of the file.

Requires ADB and cURL, the latter should be preinstalled on newer Windows versions.

# To do:
- [ ] Ask when downloading each file, in case you just want to download the client or the server alone  
- [ ] Create start menu file for the server
- [ ] Add handling of multiple ADB devices, currently it will fail if that is the case, can probably handle this for Quest 2 by running `adb devices` and finding a 14 long character string starting with `1WMHH` (possibly `1PA` for Quest 1?) correspondent to the device's serial number and passing it to the following ADB commands.
