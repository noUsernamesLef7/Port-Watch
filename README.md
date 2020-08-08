# Port Watch
A bash script that checks to see if a host is listening on a specified port.

## Why
The script is meant to be used as a trigger for other scripts. It uses the standard shell exit codes to indicate success (0) or failure (1) and allow other scripts to make decisions. I initially wrote the script to use with my rooted Nook Simple Touch eReader. I wanted to be able to trigger a sync from my Nook just by activating the wireless Android Debug Bridge. By running this script, my home server could see when the ADB connection was open and then use the adb file transfer method to sync my RSS feed articles to the eReaders library.

## How It Works
The script uses nc (netcat) to scan a pre-defined ip address and port. If it is able to establish a connection, then it exits with an exit code of 0 indicating success. If it can't connect, it will continue checking every n seconds for a set duration and then exit with exit code 1. It does send some feedback about what is happening to STDOUT.

## Dependencies
nc (netcat)

## Installation
* Clone the repository to your local machine
```
git clone git@github.com:noUsernamesLef7/portWatch.git
```
* Edit the script using a text editor, and set the $host, $port, $frequency, and $duration variables.
* Ensure the script is marked as executable
```
chmod +x portWatch.sh
```
* Call the script from inside another script (or however you want to use it)
