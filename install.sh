#!/bin/bash

TARGET_DIR=/etc/openhab/configurations

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# Files
mkdir -p ${TARGET_DIR}

install -Cv README.md ${TARGET_DIR}
install -Cv openhab_default.cfg ${TARGET_DIR}

# Directories
for DIR in items persistence rules scripts sitemaps transform; do
	mkdir -p ${TARGET_DIR}/${DIR}
	install -Cv ${DIR}/* ${TARGET_DIR}/${DIR}
done
