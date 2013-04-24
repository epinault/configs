#!/bin/bash

# Redirect stdout ( > ) into a named pipe ( >() ) running "tee"
exec > >(tee ~/last_build.log)

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -q

sudo DEBIAN_FRONTEND=noninteractive apt-get install zlib1g-dev openssl libssl-dev libreadline-dev libxml2 \
													libxslt-dev libxml2-dev build-essential git libcurl4-openssl-dev \
													autoconf curl -y -q


# get my personal configs
if [ ! -d "~/configs" ]
then
	git clone https://github.com/epinault-ttc/configs
else
	cd ~/configs
	git pull
	cd
fi
cp configs/.irbrc ~/
cp configs/.gitconfig ~/


# install chruby
if [ ! -d "~/chruby-0.3.4" ]
then
	wget -O chruby-0.3.4.tar.gz https://github.com/postmodern/chruby/archive/v0.3.4.tar.gz
	tar -xzvf chruby-0.3.4.tar.gz
	cd chruby-0.3.4/
	sudo make install
	rm chruby-0.3.4.tar.gz
	echo "source /usr/local/share/chruby/chruby.sh" >> ~/.bashrc
	cd
fi

# install ruby-build
if [ ! -d "~/ruby-build" ]
then
	git clone https://github.com/sstephenson/ruby-build.git
	cd ruby-build
	sudo ./install.sh
	cd
fi

# install ruby 1.9.3-p392
if [ ! -d "~/rubies/1.9.3-p392" ]
then
	mkdir -p ~/rubies
	ruby-build 1.9.3-p392 ~/rubies/1.9.3-p392
	cd
fi

# install sublime
if [ ! -d "~/sublime_2" ]
then
	wget -O ~/sublime_201.tar.bz2 http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1%20x64.tar.bz2
	tar jxf ~/sublime_201.tar.bz2
	mv Sublime\ Text\ 2/ sublime_2
	mkdir -p ~/bin
	ln -s ~/sublime_2/sublime_text ~/bin/subl
	rm sublime_201.tar.bz2
	cd 
fi

# reload
source .bashrc
chruby 1.9.3

# install bundler latest
gem update --system 1.8.25
gem install bundler

