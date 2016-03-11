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
#### start web, db, php and browsersync container
``./scripts/run.sh`` Note: at the first line ip and port for web container access will be printed.

#### login to a container
``docker-compose run web bash`` Note: web, db, php and browsersync are available.

#### container log files
``docker-compose logs web`` Note: web, db, php and browsersync are available.

#### delete all containers
Attention: your database will be removed, ensure you dumped it(see above).
``./scripts/clean.sh``

## livereload, browsersync, sass and coffee
Reloads your browser on code changes and compiles sass to css and coffee to javascript. [Read more](https://www.browsersync.io/).

It runs in its own container. Look on to the terminal output to get its ipadress.

If you want to change its behaviour edit the ``gulpfile.js`` in side of the folder ``./wordpress``. The gulpfile.js will be copied when you run ``./scripts/init-wordpress``.

#### adding and running gulp tasks
You can add your custom gulp tasks to the file ``./wordpress/gulpfile.js``.

To execute your custom gulp task run ``docker-compose run browsersync gulp my-custom-task``

Read mor about [Gulp](https://github.com/gulpjs/gulp/blob/master/docs/API.md).

## TODOs
  * add batch scripts for window users
  * test on linux and windows
  * add instruction for cw-basic-theme
