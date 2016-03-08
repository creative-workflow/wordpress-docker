# CW-Wordpress Development Setup

# prerequisites
You have to install:
  * [Docker](https://docs.docker.com/engine/installation/)
  * [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

# init a new wordpress repo

### 1. create a folder for your new wordpress project
``mkdir my-wp-project && cd my-wp-project``

### 2. copy the source files from this repo
``git clone --branch=master ssh://git@gitlab.creative-workflow.org:2222/cw-wordpress/cw-wordpress-docker.git . && rm -rf ./.git*``

### 3. download a fresh wordpress copy and copy our specific wp-config.php
``./scripts/setup.sh``

### 3.1 If you Use Docker Toolbox (OSX, Windows)
Launch a Docker Toolbox terminal or on OSX terminal type ``eval "$(docker-machine env default)"``

### 4. start the docker containers for your project
``./scripts/run.sh``

# database
You can share a database dump within your repo, so you can sync development with your team mates.
### export your database to data/db/dump/dump.sql
``./scripts/db-export.sh``

### import data from data/db/dump/dump.sql
``./scripts/db-import.sh``

# containers
### start containers
``./scripts/run.sh``

### login to php container
``./scripts/login.sh web``

### login to database container
``./scripts/login.sh db``

### delete containers
Attention: your database will be removed, ensure you exported it before
``./scripts/clean.sh``
