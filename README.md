# CNCFlora Nuvem

The whole "cloud" of cncflora apps, unified.

## Try it

### VirtualBox and Vagrant

This is the easiest way to run everything in a local machine.

You will need [VirtualBox](http://virtualbox.org) and [Vagrant](http://www.vagrantup.com/), them at this directory run:

    $ vagrant up

The first time of a vagrant up may take some time.

This will build the virtual machine. When ready, acess it and run all apps.

    $ vagrant ssh
    $ cd /vagrant
    $ docker-compose up -d

Again, the first run will take a while.

Wait while the VM is built them access [http://192.168.50.200/entrypoint](http://192.168.50.200/entrypoint).

Access the users app to create the first user and the checklist app to create the first db.

### Manual, using Docker

Bit more complex, but the real production way.

You will need git, [docker](http://docker.io) engine 1.11+ and [docker-compose](https://docs.docker.com/compose/install/) 1.6+.

Them run:
    
    $ git clone git@github.com:CNCFlora/nuvem
    $ cd nuvem
    $ docker-compose up

You might need to edit .env to the hostname or ip you expect the apps to run.

This will take time at the first run, as it downloads all the images, them it gets faster.

Them access it at [http://localhost](http://localhost). 

Access the users app to create the first user and the checklist app to create the first db.
 
## Deploy

- Get a recent kernel (>=3.10)
- Get [docker](https://docs.docker.com/installation/) 1.11+.
- Get [docker-compose](https://docs.docker.com/compose/install/) 1.6+.
- Get git:

    $ sudo apt-get install git

- Clone this repository:

    $ git clone https://github.com/CNCFlora/nuvem
    $ cd nuvem

- Download the images (this will take a while):

    $ ./docker-compose pull

- Setup your .env by editing the file:

- Run everything:

   $ docker-compose up -d

- Access your ip/domain and use the apps
- Access the users app to create the first user and the checklist app to create the first db.

## Data folder and backup

All data is stored under the host /var/data.

## Operations

Common day-to-day operations.

Update all services:

    $ docker-compose pull
    $ docker-compose up -d

Update a service:

    $ docker-compose pull service_name
    $ docker-compose up -d service_name

Stop a single service:

    $ docker-compose stop service_name

Stop all services:

    $ docker-compose stop

Restart a single service:

    $ docker-compose stop service_name
    $ docker-compose up -d service_name

Restart all:

    $ docker-compose stop
    $ docker-compose up -d

View logs:

    $ docker-compose logs
    $ docker-compose logs service_name

Clean-up docker leftovers:

    $ ./clear_docker.sh

## License

Apache License 2.0

