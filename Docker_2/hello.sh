#!/bin/sh

while true; do
  echo "I'm cat file hello.txt"
  date | tee -a /home/jrdeath/logs/script.log
  cat /home/jrdeath/hello.txt | tee -a /home/jrdeath/logs/script.log
  sleep 10
done

