#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

MAC=${1}
CACHE_DIR="${DIR}/cache"
CACHE_ENTRY="${CACHE_DIR}/${MAC}.vendor"

if [ ! -d ${CACHE_DIR} ]; then
	mkdir -p ${CACHE_DIR}
fi

if [ -f ${CACHE_ENTRY} ]; then
	VENDOR=$(cat ${CACHE_ENTRY})
else
	wget --output-document=${CACHE_ENTRY} http://api.macvendors.com/${MAC} &>/dev/null 
	VENDOR=$(cat ${CACHE_ENTRY})
fi

echo ${VENDOR}
