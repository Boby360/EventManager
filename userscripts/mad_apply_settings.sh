#!/bin/bash 

###########################################################
# User configuration
###########################################################
# madmin apply settings/ reload urls
# for adding multiple urls because of multiple instances -> list the urls separated with whitespaces
# Examples for madmin reload urls (madmin runing on same server):
#  - without madmin passwort (e.g. using nginx passwort instead):  apply_settings_url="http://localhost:5000/reload"
#  - with madmin passwort: apply_settings_url="-u madmin:password http://localhost:5000/reload"
apply_settings_url="http://localhost:5000/reload"

##########################################################
# script -> don't change
##########################################################
http_response=$(curl -s -o /dev/null -w '%{http_code}' $apply_settings_url)
#more information on console:
#http_response=$(curl -s -nv -o /dev/null -w '%{http_code}' $apply_settings_url)

if [ $http_response != "302" ]; then
    # handle error
    echo "FAILED with code:$http_response"
    exit 1
else
    echo "Ok"
    exit 0
fi