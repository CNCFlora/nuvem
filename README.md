# CNCFlora Nuvem

_EXPERIMENTAL_

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

## License

Apache License 2.0

