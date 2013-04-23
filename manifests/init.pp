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

define koumbit::sudo::extra-access($user, $access) {
     file { "/etc/sudoers.d/$user":
       ensure  => 'present',
       owner   => root,
       group   => admin,
       mode    => 640,
       content => "$user	$access",
       notify  => Service[apache2]
     }
}
