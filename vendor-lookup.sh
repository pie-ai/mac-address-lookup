#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

MAC=${1}
CACHE_ENTRY="${DIR}/cache/${MAC}.vendor"

if [ -f ${CACHE_ENTRY} ]; then
	VENDOR=$(cat ${CACHE_ENTRY})
else
	wget --output-document=${CACHE_ENTRY} http://api.macvendors.com/${MAC} &>/dev/null 
	VENDOR=$(cat ${CACHE_ENTRY})
fi

echo ${VENDOR}
