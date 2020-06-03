#!/bin/bash

#########
## URL to IP Resolve
## Written by: Eric Guillen
## Have a URL file called "URL.txt" with 1 URL per line
#########

URL="URL.txt"

echo "*** Begin Resolution of URL to IP ***"

while read p; do
	# Perform dig and parse out the IP
	DIG=`dig +short $p`
	echo $p : $DIG

done < $URL > URL-resolve.txt
