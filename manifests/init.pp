class koumbit::sudo {
    package { 'sudo': ensure => installed, }

    file { "/etc/sudoers":
        mode => 440, owner => root, group => 0,
        require => Package['sudo'],
    }
    if $operatingsystem == 'FreeBSD' {
        File["/etc/sudoers"] {
            path => "/usr/local/etc/sudoers",
            source => [ "puppet://$servername/secrets/sudoers.$fqdn", "puppet://$servername/secrets/sudoers.FreeBSD" ],
        }
    }
    else {
        File["/etc/sudoers"] {
            source => [ "puppet:///secrets/sudoers.$fqdn", "puppet:///secrets/sudoers" ],
        }
    }
}


