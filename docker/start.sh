#!/bin/bash

echo "Starting nginx"
/usr/sbin/nginx
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi

# If php-fpm is the last program to start, "-F" must be appended to the "/usr/sbin/php-fpm7 -F" command
echo "Starting php-fpm"
/usr/sbin/php-fpm7.1 -F
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start php-fpm: $status"
  exit $status
fi
