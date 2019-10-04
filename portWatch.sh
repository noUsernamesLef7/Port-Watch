#!/bin/bash
# A script that checks if a host is listening on a port every few seconds for a set duration
# If listening, it exits with exit code 0.
# If it reaches the duration value, it will exit with exit code 1
# I'm using this specifically to see if my Nook is listening for adb connections

# Host
host=192.168.1.17

# Port
port=5555

# Frequency, in seconds, between checks
frequency=10

# Duration; How long we should keep checking for, in seconds
duration=7200

echo "Checking ${host}:${port} every ${frequency} seconds for ${duration} seconds."
startTime=`date +%s`
while [ $(( $(date +%s) - $duration )) -lt $startTime ]
do
	sleep $frequency

	# Run netcat to scan host:port
	nc -z ${host} ${port}

	# Check to see if netcat successfully connected
	if [ $? == 0 ]
	then
		# End script with success exit code
		echo "${host} is listening on port ${port}!"
		exit 0
	fi
done

# End script with failure error code
echo "${host} was not listening on port ${port}."
exit 1
