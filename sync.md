using the built in d4m-nfs integration

In simple terms, docker-sync creates a docker container with a copy of all the application files that can be accessed very quickly from the other containers. On the other hand, docker-sync runs a process on the host machine that continuously tracks and updates files changes from the host to this intermediate container.

Out of the box, it comes pre-configured for OS X, but using it on Windows is very easy to set-up by modifying the DOCKER_SYNC_STRATEGY on the .env

Usage
comes with sync.sh, an optional bash script, that automates installing, running and stopping docker-sync. Note that to run the bash script you may need to change the permissions chmod 755 sync.sh

1) Configure your environment as you would normally do and test your application to make sure that your sites are running correctly.

2) Make sure to set DOCKER_SYNC_STRATEGY on the .env. Read the syncing strategies for details.

# osx: 'native_osx' (default)
# windows: 'unison'
# linux: docker-sync not required

DOCKER_SYNC_STRATEGY=native_osx

3) set APP_CODE_CONTAINER_FLAG to APP_CODE_CONTAINER_FLAG=:nocopy in the .env file

4) Install the docker-sync gem on the host-machine:

./sync.sh install

5) Start docker-sync and the Laradock environment. Specify the services you want to run, as you would normally do with docker-compose up

./sync.sh up nginx mysql

Please note that the first time docker-sync runs, it will copy all the files to the intermediate container and that may take a very long time (15min+). 

6) To stop the environment and docker-sync do:

./sync.sh down

Setting up Aliases (optional)
You may create bash profile aliases to avoid having to remember and type these commands for everyday development. Add the following lines to your ~/.bash_profile:

```
alias devup="cd /PATH_TO_LARADOCK/laradock; ./sync.sh up nginx mysql" #add your services
alias devbash="cd /PATH_TO_LARADOCK/laradock; ./sync.sh bash"
alias devdown="cd /PATH_TO_LARADOCK/laradock; ./sync.sh down"
Now from any location on your machine, you can simply run devup, devbash and devdown.
```

################################################################################

Additional Commands

Manually triggering the synchronization of the files:
./sync.sh sync

Removing and cleaning up the files and the docker-sync container. Use only if you want to rebuild or remove docker-sync completely. The files on the host will be kept untouched.
./sync.sh clean

###################################################################################
Additional Notes
You may run laradock with or without docker-sync at any time using with the same .env and docker-compose.yml, because the configuration is overridden automatically when docker-sync is used.
You may inspect the sync.sh script to learn each of the commands and even add custom ones.
If a container cannot access the files on docker-sync, you may need to set a user on the Dockerfile of that container with an id of 1000 (this is the UID that nginx and php-fpm have configured on laradock). Alternatively, you may change the permissions to 777, but this is not recommended.
