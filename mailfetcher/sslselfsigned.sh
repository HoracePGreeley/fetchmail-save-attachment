#!/bin/bash


if [ "$SSLSELFSIGNED" ]
dirhome=/data
dircert=/data/.sslcerts

then
  echo "SSLSELFSIGNED = true"

        if cd "$dircert" 2>/dev/null; then   # "2>/dev/null" подавление вывода сообщений об ошибках.
          echo "Dir $dircert exist."
          #chmod 700 "$dircert"

        else
          echo "Dir $dircert not exist, mkdir."
          mkdir "$dircert"
          chmod 700 "$dircert"
        fi
        echo "Download Cert"
        echo | openssl s_client -connect mail.gosparom.ru:993 2>/dev/null | openssl x509 > "$dircert"/cert.pem
        echo "Rehash"
        c_rehash "$dircert"
        echo "add configs to .fetchmailrc"
				echo "ssl" >> $dirhome/.fetchmailrc
        echo "sslcertpath $dircert" >> $dirhome/.fetchmailrc
        echo "sslfingerprint \"`openssl x509 -in "$dircert"/cert.pem -noout -md5 -fingerprint | sed 's/MD5 Fingerprint\=//g' | sed 's/\ //g'`\"" >> $dirhome/.fetchmailrc


else
  echo "\"\$SSLSELFSIGNED\" = false."
fi
