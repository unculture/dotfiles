apt-get -y update
apt-get -y upgrade
apt-get -y install flashplugin-nonfree
apt-get -y install git subversion mercurial
mkdir ~/Sources
hg clone https://vim.googlecode.com/hg/ ~/Sources/vim
cd ~/Sources/vim/src
apt-get -y install libncurses-dev
~/Sources/vim/src/configure
make install
make install clean
apt-get -y install libgnome2-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
make distclean
~/Sources/vim/src/configure --with-features=huge --enable-gui=gnome2
make install
apt-get -y install ack-grep 
ln -sf /usr/bin/ack-grep /usr/local/bin/ack
apt-get -y install python-setuptools python-pip
pip install virtualenv virtualenvwrapper
export WORKON_HOME=~/envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
apt-get -y install apache2
cd ~/Sources
wget http://modwsgi.googlecode.com/files/mod_wsgi-3.3.tar.gz
tar xvfz mod_wsgi-3.3.tar.gz
apt-get -y install python-dev apache2-prefork-dev
cd mod_wsgi-3.3
./configure
make
make install
# have to do the below manaually for some reason :-(
# echo "LoadModule wsgi_module /usr/lib/apache2/modules/mod_wsgi.so" > /etc/apache2/mods-available/wsgi.load
# then a2enmod wsgi
# this needs a password, or it'll block...apt-get -y install mysql-server
apt-get -y install php5 php5-mysql
cd ~
git clone git://github.com/unculture/dotfiles.git vim
mv vim/.vim .
mv vim/.vimrc .
apt-get -y install msttcorefonts
# Required for PIL under virtualenv apparently
apt-get install libjpeg62 libjpeg62-dev zlib1g-dev libfreetype6 libfreetype6-dev
# installing wine
add-apt-repository ppa:ubuntu-wine/ppa
apt-get update
apt-get -y install wine1.3
winecfg
cd ~/Sources
wget http://www.kegel.com/wine/winetricks
sh winetricks msxml6 gdiplus gecko vcrun2005
# if the msxml isn't working, the 64 bit version I've got from M$ seems to work
# now dig out the trial version of CS2 and install it... see http://wiki.winehq.org/AdobePhotoshop
# To add ---
