
#$LOAD_PATH.unshift("/home/deploy/.rbenv/rbenv.d/exec/gem-rehash","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/site_ruby/2.2.0","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/site_ruby/2.2.0/x86_64-linux","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/site_ruby","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/vendor_ruby/2.2.0","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/vendor_ruby/2.2.0/x86_64-linux","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/vendor_ruby","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/2.2.0","/home/deploy/.rbenv/versions/2.2.1/lib/ruby/2.2.0/x86_64-linux")
#puts $LOAD_PATH
 require 'peatio_client'
 def go(market,volume,side,price)
   client_public = PeatioAPI::Client.new endpoint: 'https://server.cryex24.com'
   client = PeatioAPI::Client.new access_key: 'VcVKRAiPz2JIDYOUt7eIz8oX5l7eXAweaXvxeZCy', secret_key: 'Lcdql0WYp4pDucRhxZ5xUxP6SvnnXywqfFaUlJ2C', endpoint: 'https://server.cryex24.com', timeout: 60
   client.post '/api/v2/orders', market: market, side: side, volume: volume, price: price
 end
 #market="btceur"
 #side="buy"
 #volume="0.11"
 #price="8849.0"
#while STDIN.gets
#  parray=$_.split(" ")
zero= ARGV[0].downcase
#puts zero
#puts ARGV[1]
#puts ARGV[2]
#puts ARGV[3]
#puts "start"
go(zero,ARGV[1],ARGV[2],ARGV[3])
#puts "end"
