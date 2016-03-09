# CW-Wordpress Development Setup

## prerequisites
Please install [Docker](https://docs.docker.com/engine/installation/)
and  [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## wordpress up and running in 20 seconds

#### 1. create a folder for your new wordpress project
``mkdir my-wp-project && cd my-wp-project``

#### 2. copy source files from this repo
``git clone --branch=master ssh://git@gitlab.creative-workflow.org:2222/cw-wordpress/cw-wordpress-docker.git . && rm -rf ./.git*``

#### 3. download a fresh wordpress copy and copy our specific wp-config.php
``./scripts/init-wordpress.sh`` Note: this script needs you to have curl installed.

#### 3.1 If you Use Docker Toolbox  on OSX or Windows
Launch a Docker Toolbox terminal by typing ``eval "$(docker-machine env default)"``

#### 4. start the web, db and php container
``./scripts/run.sh`` Note: at the first line ip and port for web container access will be printed.

## manage database
You can share a database dump within your repo, so you can sync development with your team mates.
#### export your database to ./data/db/dump.sql
``./scripts/db-export.sh``

#### import data from ./data/db/dump.sql
``./scripts/db-import.sh``

## manage container
#### start web, db and php container
``./scripts/run.sh`` Note: at the first line ip and port for web container access will be printed.

#### login to a container
``docker-compose run web bash`` Note: web, db and php are available.

#### container log files
``docker-compose logs web`` Note: web, db and php are available.

#### delete all containers
Attention: your database will be removed, ensure you dumped it(see above).
``./scripts/clean.sh``

## livereload, browsersync, sass and coffee
Reloads your browser on code changes and compiles sass to css and coffee to javascript. [Read more](https://www.browsersync.io/).

#### prerequisites
Please install [npm](http://blog.npmjs.org/post/85484771375/how-to-install-npm) and [Gulp](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md).

#### using it
Start your containers with ``./scripts/run.sh``.

In a second terminal install dependencies with ``npm install``.

Finally run ``gulp serve`` and navigate your browser to the address printed in the terminal.


## TODO
  * add bach scripts for window users
