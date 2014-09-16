# CNCFlora Nuvem

The whole "cloud" of cncflora apps, unified.

## Try it

### VirtualBox/Vagrant

The easiest way.

You will need [VirtualBox](http://virtualbox.org) and [Vagrant](http://www.vagrantup.com/), them at this directory run:

    vagrant up

This will take time ; )

Wait while the VM is built them access [http://192.168.50.200/entrypoint](http://192.168.50.200/entrypoiny).

### Manual

Little more complex, but real and faster way.

You will need [docker](http://docker.io), [ruby](http://ruby-lang.org) and [small-ops](http://github.com/diogok/small-ops) installed, them at this directory run:

    fige -d -h your_ip_here -c 'docker2etcd -u'
    ruby ping.rb

This will take time at the first run, later it gets faster.

Them access it at http://yourip/entrypoint . 

## Deploy

- Get a recent kernel (>=3.8)
- Get [docker](https://docs.docker.com/installation/).
- Get git:

    sudo apt-get install git

- Get ruby and small-ops:

    sudo apt-get install ruby
    sudo gem install small-ops

- Clone this repository:

    git clone https://github.com/CNCFlora/nuvem
    cd nuvem

- Download the images (this will take a while):

    ./pull.sh

- Setup your env:

    export HOST=your_public_ip_or_domain

- Run everything:


   ./run.sh

- Access your ip/domain and use the apps

## License

Apache License 2.0

