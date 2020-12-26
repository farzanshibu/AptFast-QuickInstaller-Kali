#!/bin/sh

clear

#================================
#1.Install Aria2
#================================

sudo apt-get install aria2
sudo cp /etc/apt/sources.list /etc/backupsources.list

echo "++======================Aria2 Installed======================++"


#================================
#2.Add Ubuntu Repo for APTFAST
#================================

echo "deb http://ppa.launchpad.net/apt-fast/stable/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list            #for APTFAST
echo "deb-src http://ppa.launchpad.net/apt-fast/stable/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list        #for APTFAST

#echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee -a /etc/apt/sources.list           #for kali tools
#echo "deb http://http.kali.org/kali kali-last-snapshot main non-free contrib" | sudo tee -a /etc/apt/sources.list     #for kali tools
#echo "deb http://http.kali.org/kali kali-experimental main non-free contrib" | sudo tee -a /etc/apt/sources.list      #for kali tools

echo "++======================Repo Updated with Ubuntu & Kali sources======================++"


#================================
#3.Install APT FAST
#================================

sudo add-apt-repository ppa:apt-fast/stable
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A2166B8DE8BDC3367D1901C11EE2FF37CA8DA16B
sudo apt-get update
sudo apt-get install apt-fast


#Remove Ubuntu Repos

echo "++======================Mesg======================++"


sudo rm /etc/apt/sources.list
sudo cp /etc/backupsources.list /etc/apt/sources.list


echo "++======================Mesg======================++"


#================================
#4.Configure APT FAST & Mirrors
#================================
#wget pulls the latest mirror status from https://launchpad.net/ubuntu/+archivemirrors.    
#The first grep extracts mirrors that are up-to-date or six-hours behind, along with 8 lines of previous context which includes the actual ftp/http URLs    The second grep extracts these ftp/http URLs

#wget -q -O- https://launchpad.net/ubuntu/+archivemirrors \ 
#| grep -P -B8 "status(UP|SIX)" \ 
#| grep -o -P "(f|ht)tp://[^\"]*"

#/etc/apt-fast.conf

echo "++======================Mesg======================++"


#================================
#5.APTFAST Upgrade & Clean
#================================

sudo apt-fast upgrade
sudo apt-fast clean
sudo apt-fast autoclean

echo "++======================Mesg======================++"


