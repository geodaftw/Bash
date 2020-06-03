#!/bin/bash

################
## Test Script for requiring arguments in your script
## Specifically around requiring a valid Port Range
################

script="argTest"
#Declare the number of mandatory args
margs=1

# Common functions - BEGIN
function example {
    echo -e "example: $script -p 443"
}

function usage {
    echo -e "usage: $script -p <Port>\n"
}

function help {
  usage
    echo -e "MANDATORY:"
    echo -e "  -p, --port  <Port>	Give a port number"
    echo -e "  -h, --help          	Prints this help\n"
  example
}

# Ensures that the number of passed args are at least equals
# to the declared number of mandatory args.
# It also handles the special case of the -h or --help arg.
function margs_precheck {
	if [ $1 ] && [ $1 -lt $margs ]; then
		if [ $1 == "--help" ] || [ $1 == "-h" ]; then
			help
			exit
		else
	    	usage
			example
	    	exit 1 # error
		fi
	fi
}

# Ensures that all the mandatory args are not empty
function margs_check {
	if [ $# -lt $margs ]; then
	    usage
	  	example
	    exit 1 # error
	elif ! [[ $1 =~ ^[0-9]+$ ]]; then
		echo -e "Sorry not a valid port number"
		usage
		example
	elif [ $1 -lt 1 ] || [ $1 -gt 65535 ]; then
		echo -e "Sorry not a valid port range"
		usage
		example
		exit
	fi
}
# Common functions - END
# Custom functions - BEGIN
# Put here your custom functions
# Custom functions - END
# Main
margs_precheck $# $1

marg0=

# Args while-loop
while [ "$1" != "" ];
do
   case $1 in
   -p  | --port )  shift
                          marg0=$1
                		  ;;
   -h   | --help )        help
                          exit
                          ;;
   *)                     
                          echo "$script: illegal option $1"
                          usage
						  example
						  exit 1 # error
                          ;;
    esac
    shift
done

# Pass here your mandatory args for check
margs_check $marg0

# Your Stuff goes here
