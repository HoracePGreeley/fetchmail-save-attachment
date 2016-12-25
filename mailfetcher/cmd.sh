#!/bin/bash
#check dir exist
dir=/data/file

if cd "$dir" 2>/dev/null; then   # "2>/dev/null" подавление вывода сообщений об ошибках.
  if [ "$DELETE_MESSAGES_AFTER_SAVE_ATTACH" ] then
    sudo -u mailfetcher fetchmail -K # DELETE_MESSAGES_AFTER_SAVE_ATTACH
  else
    sudo -u mailfetcher fetchmail # Keep messages
  fi
else
  echo "Dir $dir not exist, FIRST START."
  mkdir -p ../data/file/xml

  chown -R mailfetcher:mailfetcher /data && \
  source /data/.bashrc && \
  cd /mailfetcher && \
  /mailfetcher/setup.sh && \
  chmod 700 /data/.fetchmailrc && \
  /mailfetcher/sslselfsigned.sh
  chown -R mailfetcher:mailfetcher /data
fi
