#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir ~/data
	mkdir ~/data/portainerDB
        mkdir ~/data/mariadb
        mkdir ~/data/wordpress
fi
