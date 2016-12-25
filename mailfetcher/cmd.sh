#!/bin/bash
#check dir exist
dir=/data/file
source /data/.bashrc

if cd "$dir" 2>/dev/null; then   # "2>/dev/null" подавление вывода сообщений об ошибках.
  if [ "$DELETE_MESSAGES_AFTER_SAVE_ATTACH" ]; then
    if ["$PERIOD"]; then
      while [ 1 ]; do
          sudo -u mailfetcher fetchmail -K # DELETE_MESSAGES_AFTER_SAVE_ATTACH
          sleep $PERIOD
      done
    else
      sudo -u mailfetcher fetchmail -K # DELETE_MESSAGES_AFTER_SAVE_ATTACH
    fi

  else
    if ["$PERIOD"]; then
      while [ 1 ]; do
          sudo -u mailfetcher fetchmail # Keep messages
          sleep $PERIOD
      done
    else
      sudo -u mailfetcher fetchmail # Keep messages
    fi
  fi
else
  echo "Dir $dir not exist, FIRST START."
  mkdir -p ../data/file/xml

  chown -R mailfetcher:mailfetcher /data && \
  cd /mailfetcher && \
  /mailfetcher/setup.sh && \
  chmod 700 /data/.fetchmailrc && \
  /mailfetcher/sslselfsigned.sh
  chown -R mailfetcher:mailfetcher /data
fi
