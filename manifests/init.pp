class sudo {
  package { 'sudo': ensure => installed, }

  file { '/etc/sudoers':
    source  => ["puppet:///secrets/sudoers.${::fqdn}",
                'puppet:///secrets/sudoers' ],
    mode    => '0440',
    owner   => 'root',
    group   => 0,
    require => Package['sudo'],
  }
  if $::operatingsystem == 'FreeBSD' {
    File['/etc/sudoers'] {
      path   => '/usr/local/etc/sudoers',
      source => [ "puppet:///secrets/sudoers.${::fqdn}",
                  'puppet:///secrets/sudoers.FreeBSD' ],
    }
  }
}
