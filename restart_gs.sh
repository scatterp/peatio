#! /bin/sh

if ps aux | grep global_state.rb > /dev/null
then
    echo "Running"
else
    sleep 5
fi
