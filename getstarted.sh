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
make
make install
apt-get -y install ack-grep 
ln -sf /usr/bin/ack-grep /usr/local/bin/ack
apt-get -y install python-setuptools python-pip
pip install virtualenv virtualenvwrapper
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
apt-get -y install apache2 libapache2-mod-wsgi
cd ~
git clone git://github.com/unculture/dotfiles.git vim
mv vim/.vim .
mv vim/.vimrc .
