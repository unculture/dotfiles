yum -y update
#yum -y install flashplugin-nonfree
yum -y install git subversion mercurial
# A requirement for one of my Vim plugins
yum -y install ack
# Set up a basic python dev environment
yum -y install python-pip
echo 'alias pip="pip-python"' >> .bashrc
source .bashrc
pip install virtualenv virtualenvwrapper
echo 'export WORKON_HOME=$HOME/Work/python_environments' >> .bashrc
echo 'export PROJECT_HOME=$HOME/Work/python' >> .bashrc
echo 'source $HOME/.local/bin/virtualenvwrapper.sh' >> .bashrc
echo 'export PIP_VIRTUALENV_BASE=$WORKON_HOME' >> .bashrc
echo 'export PIP_RESPECT_VIRTUALENV=true' >> .bashrc
source .bashrc
mkdir -p $WORKON_HOME
echo 'CACHE=$WORKON_HOME/.pip-cache' >> $WORKON_HOME/postmkvirtualenv
echo 'mkdir -p "$CACHE"' >> $WORKON_HOME/postmkvirtualenv
echo '$VIRTUAL_ENV/bin/pip install --download-cache="$CACHE" ipython' >> $WORKON_HOME/postmkvirtualenv
echo 'alias pip="$VIRTUAL_ENV/bin/pip"' >> $WORKON_HOME/postactivate
echo 'alias pip="pip-python"' >> $WORKON_HOME/postdeactivate
#echo 'proj_name=$(echo $VIRTUAL_ENV|awk -F"/" "{print $NF}")' >> $WORKON_HOME/postmkvirtualenv
#echo 'mkdir -p $HOME/Work/projects_python/$proj_name' >> $WORKON_HOME/postmkvirtualenv
#echo 'add2virtualenv $HOME/Work/projects_python/$proj_name' >> $WORKON_HOME/postmkvirtualenv
#echo 'cd $HOME/Work/projects_python/$proj_name' >> $WORKON_HOME/postmkvirtualenv
#echo 'proj_name=$(echo $VIRTUAL_ENV|awk -F"/" "{print $NF}")' >> $WORKON_HOME/postactivate
#echo 'cd $HOME/Work/projects_python/$proj_name' >> $WORKON_HOME/postactivate

yum -y install httpd mod_wsgi
#yum -y install postgresql postgresql-server

#yum install postgresql postgresql-server
# recipe for getting postgresql to work
# su to root, su to postgresql, run the following
#initdb -D /var/lib/pgsql/data/
# try not running this, as it seems to error when I did it...
#pg_ctl -D /var/lib/pgsql/data -l logfile start
# try to start the server as sudo from normal user
# sudo systemctl start postgresql.service
# fuck it. Doesn't work...


#mysql
yum install -y mysql-server
yum install -y mysql-devel python-devel # needed for installing python-mysql... Also requires gcc
#systemctl start mysqld.service
#systemctl enable mysqld.service
# see recipe here http://www.if-not-true-then-false.com/2010/install-mysql-on-fedora-centos-red-hat-rhel/
# or here http://www.server-world.info/en/note?os=Fedora_16&p=mysql


yum -y install php5 php5-mysql php5-gd curl php5-curl
#also install curl...
cd ~
git clone git://github.com/unculture/dotfiles.git vim
mv vim/.vim .
mv vim/.vimrc .
yum -y install msttcorefonts
# Required for PIL under virtualenv apparently
yum install libjpeg62 libjpeg62-dev zlib1g-dev libfreetype6 libfreetype6-dev
# installing wine
add-apt-repository ppa:ubuntu-wine/ppa
yum update
yum -y install wine1.3
winecfg
cd ~/Sources
wget http://www.kegel.com/wine/winetricks
sh winetricks msxml6 gdiplus gecko vcrun2005
# if the msxml isn't working, the 64 bit version I've got from M$ seems to work
# now dig out the trial version of CS2 and install it... see http://wiki.winehq.org/AdobePhotoshop
# To add ---


#sass
yum -y install rubygems1.8
gem install sass
