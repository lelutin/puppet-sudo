# manifests/init.pp - manage sudo stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class sudo {
    case $kernel {
        linux: { include sudo::linux }
        default: { include sudo::base }
    }
}

class sudo::base {
    if $sudo_deploy_sudoers {
      file{'/etc/sudoers':
        source => [ "puppet://$source/files/sudo/sudoers/${fqdn}/sudoers",
                    "puppet://$source/files/sudo/sudoers/sudoers",
                    "puppet://$source/sudo/sudoers/${operatingsystem}/sudoers",
                    "puppet://$source/sudo/sudoers/sudoers" ],
        owner => root, group => 0, mode => 0440;
      }
    }
}

class sudo::linux inherits sudo::base {
    package{'sudo':
        ensure => installed,
    }

    if $sudo_deploy_sudoers {
      File['/etc/sudoers']{
        require => Package['sudo'],
      }
    }
}
