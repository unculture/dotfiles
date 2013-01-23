From http://randyfay.com/content/php-52-ubuntu-1004-lucid-lynx-seems-work-1204-too

Seems to work in 12.10.

Put php in /etc/apt/preferences.d
Put karmic.list in /etc/apt/sources.d

Then (after removing these packages first if you have to)
sudo apt-get update
sudo apt-get install apache2 mysql-server php5 libapache2-mod-php5 php5-xsl php5-gd php-pear libapache2-mod-auth-mysql php5-mysql php5-curl php5-memcache
