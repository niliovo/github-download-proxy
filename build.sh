#!/bin/bash

apt update
apt upgrade -y
apt install gcc nginx -y
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir flask requests uwsgi
pip cache purge
pip uninstall pip -y
apt remove gcc -y
apt autoremove -y
apt autoclean -y
