#!/bin/bash
NAME=$1
LASTNAME=$2
SHOW=$3
API_KEY=$4

if [ "$SHOW" = "true" ]; then
        echo "Hello, $NAME, $LASTNAME"
        echo "Using API key (masked): ${API_KEY:0:3}***"
else
        echo "If you want to see the name, then please mark the show option"
fi

echo "Thanks for running the script."
