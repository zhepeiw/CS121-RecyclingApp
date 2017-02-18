## CS121-RecyclingApp

### Prerequisite

To successfully set up the server, 
you need to install Docker and 
Docker-compose on your host machine.
Personally I recommend using the 
packaged app like Docker for Mac or
Docker for Windows instead of building
from source.

### Installation

In this repository, run

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
