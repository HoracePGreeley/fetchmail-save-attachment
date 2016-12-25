#!/bin/bash

sed $(echo s/\<IMAPHOST\>/$IMAPHOST/g) .fetchmailrc | \
sed $(echo s/\<IMAPPORT>/$IMAPPORT/g) | \
sed $(echo s/\<IMAPUSER\>/$IMAPUSER/g) | \
sed $(echo s/\<IMAPPASS\>/$IMAPPASS/g) > ../data/.fetchmailrc

cp .procmailrc ../data/.procmailrc
