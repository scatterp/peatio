Credit:rgtoffolo

Follow bellow the instructions to configure Peatio using 3 servers.

First Server - MySql
Just install MySql using procedures as Peatio installation described

Second Server - Bitcoind & RabbitMQ

Install Bitcoind
Install RabbitMQ
Follow the instructions to create Bitcoin.conf
Add a new line in Bitcoin.conf:

    rpcallowip=[IP address or dns name of your Peatio Webserver]
Third Server - Peatio Webserver

Install Peatio using the default procedures but do not install MySql, Bitcoind and RabbitMQ
Add a new line in database.yml

    host: [IP address or dns name of your MySql Server]
    ***you should to add this configuration before running the databse creation commands
Change the configuration in currencies.yml

    rpc: [username]:[password]@[IP address of your RabbitMQ server]:18332 
Change the configuration in amqp.yml

    host: [IP address or dns name of your RabbitMQ server]
restart all daemons.
