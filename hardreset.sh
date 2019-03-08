sudo service nginx stop
bundle exec rake daemons:stop

#bundle exec rake db:setup
bundle exec rake assets:clobber
bundle exec rake assets:clean
bundle exec rake assets:precompile
bundle exec rake daemons:start
sudo service nginx start
bundle exec rake daemons:status
