sudo service nginx stop
bundle exec rake daemons:stop
bundle exec rake daemons:start
sudo service nginx start
bundle exec rake daemons:status
