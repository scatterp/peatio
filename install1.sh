#!bin/bash
sudo apt-get update
sudo apt-get upgrade -y
wget https://gist.githubusercontent.com/scatterp2/3f6b1ae1965de18057a896bedc9a6132/raw/cb230dc8b9cc5dab6da64f7e34cf5e50ae373092/passenger.conf
wget https://gist.githubusercontent.com/scatterp2/5aab2adb578020f93d0f2146e0aac61b/raw/2b2e5fc7e8a95eea3d4b791217c5d1e5b848cd43/bitcoin.conf
sudo apt-get remove -y apache2
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev imagemagick gsfonts nodejs nginx-extras redis-server software-properties-common python-software-properties nano dialog vim
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y bitcoind
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-b$
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
rbenv install 2.2.2
rbenv global 2.2.2
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
rbenv rehash
read -p "Press [Enter] key to continue..."
mkdir -p ~/.bitcoin
cp bitcoin.conf ~/.bitcoin/bitcoin.conf
dialog --msgbox "enter bitcoind user password settings and save" 10 20
sudo nano ~/.bitcoin/bitcoin.conf
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc |sudo apt-key add -
sudo apt-get update
sudo apt-get install -y rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart
wget http://localhost:15672/cli/rabbitmqadmin
chmod +x rabbitmqadmin
sudo mv rabbitmqadmin /usr/local/sbin
sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe'
sudo apt-get update
sudo apt-get install -y mysql-server-5.6 redis-server libmysqlclient-dev
sudo apt-get install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

# Add our APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

# Install Passenger + Nginx
sudo apt-get install -y --allow-unauthenticated nginx-extras passenger
#bitcoind
sudo cp passenger.conf /etc/nginx/passenger.conf
#sudo echo "include  /etc/nginx/passenger.conf;" >> /etc/nginx/nginx.conf
#echo "include  /etc/nginx/passenger.conf;" |sudo tee -a /etc/nginx/nginx.conf
cp /etc/nginx/nginx.conf .
sed -i '64i\passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;' nginx.conf
sed -i '65i\passenger_ruby /home/deploy/.rbenv/shims/ruby;' nginx.conf
sudo cp nginx.conf /etc/nginx/nginx.conf
echo "remaining steps 10"
echo "export RAILS_ENV=production" >> ~/.bashrc
source ~/.bashrc
mkdir -p ~/peatio
#git clone https://github.com/ctubio/Krypto-trading-bot.git ~/K
git clone https://github.com/scatterp/peatio.git ~/peatio/current
#git checkout testing01
cd ~/peatio/current/
pwd
#sudo apt-get install -y ruby-bundler
bundle install --without development test --path vendor/bundle
bin/init_config
dialog --msgbox "enter pusher <US1> settings and save" 10 20
sudo nano ~/peatio/current/config/application.yml
dialog --msgbox "enter database password  in settings and save" 10 20
sudo nano ~/peatio/current/config/database.yml
dialog --msgbox "enter bitcoind user password settings and :q to save" 10 20
sudo nano ~/peatio/current/config/currencies.yml
cd ~/peatio/current/
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start
bundle exec rake db:setup
bundle exec rake assets:precompile
pwd
#cd /home/deploy/K/
#pwd
#make install
#cd ..
#git clone https://github.com/scatterp3/peatio.git ~/jpeatio/current
#cd ~/jpeatio/current
#rbenv global jruby-9.1.13.0
#gem install bundler
#bundle install
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/deploy/peatio/current/config/nginx.conf /etc/nginx/conf.d/peatio.conf
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y python-certbot-nginx
sudo service nginx stop
sudo service nginx start
bundle exec rake daemons:start
#sudo service nginx status
bundle exec rake daemons:status
mv pc ..
echo "you can now setup ssl optionally start bitcoind if you have over 2gb or visit the website (its up and running)"
