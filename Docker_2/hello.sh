#!/bin/sh

while true; do
  echo "I'm cat file hello.txt"
  date | tee -a /logs/script.log
  cat /hello/hello.txt | tee -a /logs/script.log
  sleep 10
done

