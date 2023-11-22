# Guacamole for `docker compose`

This is a simple setup for Guacamole using `docker compose`.
I created it because I was so frustrated with how tedious the initial setup process is described at <https://guacamole.apache.org/doc/gug/>.
I just wanted a copy-paste solution for `docker compose`.

## Prerequisites

You'll may need `git` to download these files.
You can learn how to install it here: <https://git-scm.com/>

You'll also need a working installation of `docker`.
You can learn how to install it here: <https://docs.docker.com/engine/install/>.

## Run in Docker

First, clone this repository and set it as your working directory.

```sh
git clone https://github.com/MarcosLopezC/guacamole-docker-compose.git
cd guacamole-docker-compose
```

Then, run `setup.sh`.
This script will initialize the database script, download the docker images, and start the container.

```sh
sudo sh ./setup.sh
```

After the script runs successfully, you should be able to navigate to <http://localhost:8080/guacamole> and log in using the default credentials:

```
username: guacadmin
password: guacadmin
```

Consider creating a new user and deleting `guacadmin` if you're going to be using this setup in a shared network.

## How to stop the Guacamole

You can stop the Guacamole service by executing this command:

```sh
sudo docker compose -f ./guacamole/docker-compose.yml down
```

To start it again, you can either run `setup.sh` again or run this command:

```sh
sudo docker compose -f ./guacamole/docker-compose.yml up -d
```