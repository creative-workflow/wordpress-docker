# CW - Wordpress Development Setup
<br>

## Install the following dependencies
  * [Docker](https://docs.docker.com/engine/installation)
  * [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  * [nodeJs](https://nodejs.org) (if you want to use browser-sync or gulp
<br><br>

## Wordpress running in 20 seconds

#### 1. Create a folder for your new wordpress project
``mkdir my-wp-project && cd my-wp-project``
<br><br>

#### 2. Copy source files from this repo
``git clone --branch=master ssh://git@gitlab.creative-workflow.org:2222/cw-wordpress/cw-wordpress-docker.git . && rm -rf ./.git*``
<br><br>

#### 3. Download a fresh wordpress copy and copy our specific wp-config.php
``./scripts/init-wordpress.sh`` 
Note: *For this script you need to have [curl](https://curl.haxx.se/) installed.*

##### 3.1 If you use Docker Toolbox on OSX or Windows
Start the default docker VM ``docker-machine start default``.

Launch a Docker Toolbox terminal ``eval "$(docker-machine env default)"``.
<br><br>

#### 4. Start the web, db and php container
``./scripts/run.sh``
<br>
Note: *At the beginning an info will be printed containing the ip where you can access your wordpress installation. E.g.*
<br><br>
```
 -> starting wordpress web container on: 192.168.99.100:9999
 ```
<br>
Now follow the wordpress setup guide if you **don't want to use browser-sync**. 
<br><br>
Note: *In the terminal where you started the docker machine you can see the requests sent from your browser.*
<br>
Note: *With ctrl+c you can stop the docker container in the terminal.*
<br><br>

#### 5. If you want to use browser-sync
Open a new terminal inside your project folder and run as first ``npm install -g gulp`` and then ``npm install``. 
<br>
Note: *If you have access errors prepend the command with ``sudo``.*

Now you can start browser-sync by typing ``gulp serve``. This will open your standard browser with your wordpress page.

Follow the wordpress setup guide.
<br>
Note: *With Ctrl+C you can stop browser-sync in the terminal.*

##### Using browser-sync

If you edit e.g. the style.css in ``my-wp-project/wordpress/wp-content/themes/twentysixteen`` your browser refreshes automatically.

The browser-sync user interface is accessible via ``localhost:3002``.

##### Change the watched wordpress theme

If you want to watch another or your own custom wordpress theme, change the settings in ``my-wp-project/gulp/config.yml`` and restart with ``gulp serve``.
<br><br>

## Manage database
You can share a database dump within your repo, so you can sync development with your team mates.
#### export your database to ./data/db/dump.sql
``./scripts/db-export.sh``

#### import data from ./data/db/dump.sql
``./scripts/db-import.sh``
<br><br>

## Manage container
#### start web, db, php and browsersync container
``./scripts/run.sh`` 
<br>
Note: *At the first line ip and port for web container access will be printed.*

#### login to a container
``docker-compose run web bash`` 
<br>
Note: *Web, db, php and browsersync are available.*

#### container log files
``docker-compose logs web`` 
<br>
Note: *Web, db, php and browsersync are available.*

#### delete all containers
Attention: your database will be removed, ensure you dumped it(see above).

``./scripts/clean.sh``
<br><br>

## livereload, browsersync, sass and coffee
Reloads your browser on code changes and compiles sass to css and coffee to javascript. [Read more](https://www.browsersync.io/).

It have to run on your local machine because of filesystem event issues.

#### adding and running gulp tasks
You can add your custom gulp tasks to the files in the folder ``./gulp/*``.

Read more about [Gulp](https://github.com/gulpjs/gulp/blob/master/docs/API.md).

## TODOs
  * add batch scripts for window users
  * test on linux and windows
  * add instruction for cw-basic-theme
