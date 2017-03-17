# CW - Wordpress Development Setup
You will get a running wordpress instance based on the latest wordpress source, a database where the wordpress data will be stored, phpmyadmin for database management and extendible gulp tasks with livereload preconfigured. And this all running inside of docker container so your dev system stays clean =)

## Install the following dependencies
  * [Docker](https://docs.docker.com/engine/installation)
  * [Docker Compose](https://docs.docker.com/compose/install/)
  * [GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  * [nodeJs](https://nodejs.org) (if you want to use browser-sync or gulp tasks)

## Wordpress up and running in 10 minutes

#### 1. Create a folder for your new wordpress project
`mkdir my-wp-project && cd my-wp-project`


#### 2. Copy source files from this repo
`git clone --branch=master git@github.com:creative-workflow/wordpress-docker.git . && rm -rf ./.git*`


#### 3. Download a fresh wordpress copy and copy our specific wp-config.php
`./scripts/init-wordpress.sh`
Note: *For this script you need to have [curl](https://curl.haxx.se/) installed.*
Note: *You can copy your own wordpress source code to a folder named 'wordpress' inside of your 'my-wp-project' folder*

#### 4. Setup and run the web, db and php container
`./scripts/run.sh`

Note: *At the beginning an info will be printed containing the ip where you can access your wordpress installation. E.g.*

```
 -> starting wordpress web container on: 0.0.0.0:9999
 -> starting phpmyadmin container on: 0.0.0.0:9001
 -> if you want to use browsersync or gulp open another terminal
 -> !db container needs a few minutes first time to setup db
 more info: https://github.com/creative-workflow/wordpress-docker
```

If you **don't want to use browser-sync** follow the wordpress [setup guide](https://codex.wordpress.org/Installing_WordPress#Step_5:_Run_the_Install_Script) inside of your browser and ignore the following steps.

Note: *Sometimes the wordpress setup gets a timeout, but a reload shows the correct installation.*

Note: *In the terminal where you started the docker machine you can see the requests sent from your browser.*

Note: *With Ctrl+C you can stop the docker container in the terminal.*


#### 5. If you want to use browser-sync
Open a new terminal inside your project folder and run:

```
npm install -g gulp coffee-script
npm install --cached
```

Note: *If you have access errors prepend the commands with `sudo`.*

Now you can start browser-sync by typing `gulp serve`. This will open your standard browser with your wordpress page.

Follow the wordpress setup guide.

Note: *With Ctrl+C you can stop browser-sync in the terminal.*

##### Using browser-sync

If you edit e.g. the style.css in `my-wp-project/wordpress/wp-content/themes/twentysixteen` your browser refreshes automatically.

The browser-sync user interface is accessible via `localhost:3002`.

##### Change the watched wordpress theme

If you want to watch another or your own custom wordpress theme, change the settings in `my-wp-project/gulp/config.yml` and restart with `gulp serve`.


## Manage database
You can share a database dump within your repo, so you can sync development with your team mates. *(remember step 3.1)*
#### export your database to ./data/db/dump.sql
`./scripts/db-export.sh`

#### import data from ./data/db/dump.sql
`./scripts/db-import.sh`

#### using phpmyadmin
Have a look at step 4 to finde out where your phpmyadmin instance is accessible via web browser. Login in with:
  * host: *leave blank*
  * user: root
  * password: *leave blank*

## Manage container
#### start web, db, php and phpmyadmin container
`./scripts/run.sh`

Note: *At the first line ip and port for web container access will be printed.*

#### login to a container
`docker-compose run web bash`

Note: *web, db, php and phpmyadmin are available.*

#### container log files
`docker-compose logs web`

Note: *web, db, php and phpmyadmin are available.*



#### delete all containers
Attention: your database will be removed, ensure you dumped it(see above).

`docker-compose stop && docker-compose rm`


## Livereload, Browsersync, Sass and Coffee
Reloads your browser on code changes and compiles sass to css and coffee to javascript. [Read more](https://www.browsersync.io/).

It has to run on your local machine because of filesystem event issues.

#### adding and running gulp tasks
You can add your custom gulp tasks to the files in the folder `./gulp/*`.

Read more about [gulp](https://github.com/gulpjs/gulp/blob/master/docs/API.md).


## TODOs
  * add batch scripts for window users
  * add instruction for cw-basic-theme, sass and coffee
  * integrate https://github.com/easy-website-generator/easy-website-generator
