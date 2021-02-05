# Preparing a server for automated deployment with GitHub Actions

To start preparing a server for automated deployment with GitHub actions for use of serving API's or full fledged websites with Nginx or Apache, a server with full root access is required or a system admin who has such priviliges.

# Setting up the user

The first step to automatically deploy with GitHub actions to setup the CI user to prevent any unwanted permissions to cause trouble in the future. The steps for doing so are provided in the `prep-server.sh`, this script can be copy and pasted an ran on the server itself.

# Obtaining an (Open)SSH key

To generate a key to be used in the pipeline, run the following command:

```
ssh-keygen
```

If you are going to save this key somewhere it is recommended to run this command in a designated folder, for example:

```
mkdir -p ~/Documents/Keys/
cd ~/Documents/Keys/
ssh-keygen -f super_secret
```

## Public key

Obtain the public key through the following command, and copy it to your clipboard on to a note taking application to save it:

```
cat ~/.ssh/id_rsa.pub
OR
cat ~/Documents/Keys/super_secret.pub
```

After obtaining the public key, log on to the ci user on the dedicated server and add the public key to the trusted keys. This can be done in 2 ways:

**Before doing this log on to the CI user:**

```
sudo su ci
```

**You echo it to a file:**

```
echo "<Public key>" >> ~/.ssh/authorized_keys
```

**Add it manually**

```
vim ~/.ssh/authorized_keys
```

## Private key

After adding the public key to the trusted keys on the ci user, now you need to add your private key to the secrets in the GitHub repo. Obtain the private key by printing the key you generated with the following command, make sure you are in the correct directory and machine when doing this:

**Run this command on the machine where you generated the key**

```
cat ~/.ssh/id_rsa
OR
cat ~/Documents/Keys/super_secret
```

Copy the outputs and add it to your secrets in the GitHub repo, name the variable accordingly!

# Notes

This procedure is tested on Linux only, no guarantee is given for any other OS'es.

## Permissions on added authorized keys

If permissions cause the system not to recognize the added key as valid, run the following comamnds logged in as the CI user:

```
cd ~
chmod 700 .ssh
sudo chmod 640 .ssh/authorized_keys
sudo chown $USER .ssh
sudo chown $USER .ssh/authorized_keys
```
