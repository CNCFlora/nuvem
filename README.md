# CNCFlora Nuvem

The whole "cloud" of cncflora apps, unified.

## Try it

### VirtualBox/Vagrant

The easiest way.

You will need [VirtualBox](http://virtualbox.org) and [Vagrant](http://www.vagrantup.com/), them at this directory run:

    $ vagrant up

This will build the virtual machine. When ready, acess it and run all apps.

    $ vagrant ssh
    $ cd /vagrant
    $ fige

This will take a while : )

Wait while the VM is built them access [http://192.168.50.200/entrypoint](http://192.168.50.200/entrypoint).

### Manual/Docker

Bit more complex, but real and faster way.

You will need git, [docker](http://docker.io), [ruby](http://ruby-lang.org) and [fige](http://github.com/diogok/fige) installed, them at this directory run:
    
    $ git clone git@github.com:CNCFlora/nuvem
    $ cd nuvem
    $ fige //HOST=your_ip fige

This will take time at the first run, as it downloads all the images, them it gets faster.

Them access it at http://localhost. 

## Deploy

- Get a recent kernel (>=3.8)
- Get [docker](https://docs.docker.com/installation/).
- Get git:

    $ sudo apt-get install git

- Get ruby and fige:

    $ sudo apt-get install ruby
    $ sudo gem install fige

- Clone this repository:

    $ git clone https://github.com/CNCFlora/nuvem
    $ cd nuvem

- Download the images (this will take a while):

    $ ./pull.sh

- Setup your env:

    $ export HOST=your_public_ip_or_domain

- Run everything:

   $ fige

- Access your ip/domain and use the apps

## License

Apache License 2.0

