class { 'sudo': dir => '/tmp/sudoers.d' }

sudo::access { 'foo': }
