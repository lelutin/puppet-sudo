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

define sudo-user-alias ($ensure = 'present', $groupname, $members) {
     file { "/etc/sudoers.d/00-user_alias-$title":
       ensure  => $ensure,
       owner   => root,
       group   => root,
       mode    => 440,
       content => "# THIS FILE IS MANAGED BY PUPPET !\n\nUser_Alias $groupname = $members\n",
     }
}

define sudo-extra-access($ensure = 'present', $user, $access) {
     file { "/etc/sudoers.d/01-user_access-$title":
       ensure  => $ensure,
       owner   => root,
       group   => root,
       mode    => 440,
       content => "# THIS FILE IS MANAGED BY PUPPET !\n\n$user        $access\n",
     }
     
}

