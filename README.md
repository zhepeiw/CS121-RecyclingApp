## CS121-RecyclingApp

### Production URL:

- Symbolic: http://recycle.cameric.cn
- Original: http://recyclingapp.us-east-1.elasticbeanstalk.com/ 


### Prerequisite

To successfully set up the server, 
you need to install Docker and 
Docker-compose on your host machine.
Personally I recommend using the 
packaged app like Docker for Mac or
Docker for Windows instead of building
from source.

### Installation

#### Create env file

Before you do anything, you **MUST** complete this step:

In the root directory (suppose `CS121-RecyclingApp`) create this file:

```
.env
```

This file will store your own environment variables and you must
have it to run compose up.

#### Start containers

In the root directory, run

```bash
$ docker-compose up
```

This should set up both containers
for the server and the MySQL database.
After the containers finish setting up,
you shoule access the server through
`http://localhost:3000` normally in 
your browser.

After you make changes in the `recycling-server`
directory, the change will be automatically
sync-ed into the container, and rails
 will update the content according (it 
has a built-in file watcher), so you 
shouldn't need to restart the container 
except for adding gems (explained below).

If you want to shutdown the containers
but keep the images, run

```bash
$ docker-compose down
```

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

If you want to access the Rails 
container (a basic Ubuntu shell),
run

```
$ docker exec -it recycling-server /bin/bash
```

If you want to look at the logs
for a running container (very useful),
run

```
$ docker logs -f recycling-server
```

Note: all `docker` commands could
be run at **any place** in the shell.
However, `docker-compose` commands
could only run in a directyory that
contains `docker-compose.yml`, i.e.
the root of this repository.

### Add Gem

If you want to add a new Gem,
currently you need to do three steps:
  - add the Gem into `Gemfile`
  - access the Rails container using the command above
  - check that you are in `/srv/server` directory and run `bundle install`
  - [optional]: restart the container

  
Note: running `gem install xxx` 
on your host machine will **NOT** work!

Note2: Tony will look into ways (e.g. file watchers) that 
effectively run `bundle install` by itself everytime
you change the Gemfile.
