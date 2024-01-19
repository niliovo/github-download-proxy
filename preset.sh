#!/bin/bash

apt update

apt install gcc nginx -y

pip install --upgrade pip

pip install flask requests uwsgi

apt remove gcc -y

apt autoremove -y

apt autoclean -y
