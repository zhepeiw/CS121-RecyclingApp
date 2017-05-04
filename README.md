## CS121-RecyclingApp - Recico

Recico is a web-based, mobile-compatible application that aggregates and displays local recycling information. 

The goal of the application is to make the process of finding out what can be recycled where as easy as possible, so that even people without particular dedication to the cause of recycling will look up the information and separate their trash. 

#### Production URL:

- Symbolic: http://recycle.cameric.cn
- Original: http://recyclingapp.us-east-1.elasticbeanstalk.com/ 

### Installation

#### Prerequisite

To successfully set up the server, 
you need to install Docker and 
Docker-compose on your host machine.
Personally I recommend using the 
packaged app like Docker for Mac or
Docker for Windows instead of building
from source. 

Links to related websites:

  - [Docker](https://www.docker.com/)
  - [Docker Compose](https://docs.docker.com/compose/)
  - [Docker For Mac](https://www.docker.com/docker-mac)
    - Note: according to Docker best practices, you should only allow certain mount points that contain your source.
      This can be done through the `File Sharing` tab in Docker for Mac preferences. Check [this page](https://docs.docker.com/docker-for-mac/osxfs/)
      for more details.
      
After you successfully install Docker on your computer, clone this repo.
If you use Docker for Mac, move the repo directory into a valid mount point directory
(default to be `~`).

#### Add repository to docker path

In Docker Preferences -> Shared Drives, add the path to the parent directory of your repository. (Mac)
In Docker Settings -> Shared Drives, add C drive. (Windows)

#### Create env file

Before you do anything, you **MUST** complete this step:

In the root directory of the repo (suppose `CS121-RecyclingApp/`), create this file:

```
.env
```

you can create it with the `touch` command. 
This file will store your own environment variables and you must
have it in order to run compose up.

#### Start containers

In the root directory of the repo, run

```bash
$ docker-compose up
```

This should set up both containers
for the server and the MySQL database.
After the containers finish setting up,
you should be able to access the server through
`http://localhost:3000` normally in 
your browser.

After you make changes in the `recycling-server`
directory, the change will be automatically
sync-ed into the container, and rails
 will update the content accordingly (it 
has a built-in file watcher), so you 
shouldn't need to restart the container 
except for adding gems (explained below).

If you want to shutdown the containers
but keep the images, run

```bash
$ docker-compose down
```
This works for any terminal or bash window.

or `CTRL+C` if you are in the interactive log session. 

#### [Optional] Get rid of the `Cannot render console` warning

If you have set up the containers and try
to access the main page in the browser, you may
find this warning in your terminal log:

```text
Cannot render console <IP> at 2017-02-23 04:39:48 +0000
```

Since it's an warning, it will not affect the server
requests. However, if you find this error annoying,
you may follow these steps:

In your `.env` file, add this line:

```text
DOCKER_HOST_IP=<IP>
```

where `IP` is the ip address shown above in the error message.
After this, restarting your containers `down and up`
and the error should go away.

### Usage

#### Useful Docker commands

Note: all `docker` commands could
be run at **any place** in the terminal.
However, `docker-compose` commands
could only run in a directory that
contains `docker-compose.yml`, i.e.
the root of this repository.

If you want to access the Rails 
container (a basic Ubuntu shell),
run

```
$ docker exec -it recycling-server /bin/bash (for mac)
$ winpty docker exec -it recycling-server bash (for windows)
```

If you want to look at the logs
for a running container (very useful),
run

```
$ docker logs -f recycling-server
```

Kill a running container and remove its instance:

```
$ docker stop recycling-server && docker rm -v recycling-server
```

See all containers (both running and idle):

```
$ docker ps -a
```

#### Add Gem

If you want to add a new Gem,
currently you need to do three steps:
  - add the Gem into `Gemfile` normally
  - access the Rails container using the command above
  - check that you are in `/srv/server` directory and run `bundle install`
  - [optional]: restart the container

  
Note: running `gem install xxx` 
on your host machine will **NOT** work because 
your server does not run on your computer!

#### DB Migrations

In development environment, `docker-compose` will call
`bin/rake db:migrate && bin/rake db:seed` every time we start the server container.
Therefore if you add a new migration to the system, 
you could do either of the two methods below:

- Stop and restart the server, which triggers the automatic migration and seed
- Enter into the container using the method shown above and run `bin/rake db:migrate`
  inside. In that case you don't need to restart the container.

### Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

### Known Issues and Limitations
1. Only new city can be added, not new categories.
2. Links on top of city page doesn't work.
3. Link for contribution in the search result page is not very visible.
4. Some developer API not implemented. 
5. No error handling and no form checking page for create new cities (name, facility is minimum required). 
6. When adding new city, there is a possible bug where if facility name and address pair is a duplicate, it will fail. 
7. City information page displays all categories regardless of whether city can recycle anything from this category.
8. One account can only create and manage one city.

### ci folder
This is a folder for continuously deploying the app. If you fork the project, you will have you setup CircleCI on the new repository.

### Credits

CS121 Recico Team - Yulang Wang, Zhepei Wang, Zhenghan Zhang and Weiyu Zhou

### License

MIT License
