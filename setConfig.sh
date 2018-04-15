#!/bin/bash

# Move to the directory with the config files
cd /usr/share/nginx/html

echo "Using Node_Env ($NODE_ENV) for choosing config."

# Copy the right config based on the NODE_ENV
if [ $NODE_ENV = "prod" ] || [ $NODE_ENV = "production" ]; then
  mv config.prod.js config.js
fi
