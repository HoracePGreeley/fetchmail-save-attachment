#Mailfetcher
Docker image based on centos, fetchmail & procmail & ripmime for fetching external mail accounts and saving attachment from messages in provided volume  (for example: /data/file/xml)

##Usage

Create /data dir
```
mkdir ~/data
touch data/.bashrc
```
and provide data/.bashrc with following lines
```
  export IMAPHOST=<imap-host>
  export IMAPPORT=<imap-port>
	export IMAPUSER=<Imap-User>
	export IMAPPASS=<Imap-Password>
	export SSLSELFSIGNED=false
	export DELETE_MESSAGES_AFTER_SAVE_ATTACH=false  
```

#If you use Self signed certificate
```
export SSLSELFSIGNED=true   
```
Hash of the certificate will be accomplished by c_rehash. Automatically get the key fingerprint and add print key and the path to the folder with certificates in .fetchmailrc file.

# Delete all messages from mailboxes after save attachment
WARNING!!!  Create new email for this option. Don't use your mailbox.
```
	export DELETE_MESSAGES_AFTER_SAVE_ATTACH=true
```

# build
```
	cd <DockerfileDir>
	docker build -t <ImageName> .
```

# Create Container
```
cd ~/; docker run -ti --name <ContainerName> -v $(pwd)/data:/data <ImageName>
```

# Start Container
```
docker start -i <ContainerName>
```
