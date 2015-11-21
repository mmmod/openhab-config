#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

cp -rv README.md items openhab_default.cfg persistence rules scripts sitemaps transform /etc/openhab/configurations
