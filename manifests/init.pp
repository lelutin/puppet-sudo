# manifests/init.pp - manage sudo stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class sudo(
  $deploy_sudoers = $sudo::deploy_sudoers,
  $path = $sudo::params::path,
  $dir = $sudo::params::dir
) inherits sudo::params {

  package {'sudo':
    ensure => installed,
  }

  if $sudo::deploy_sudoers {
    file {
      $sudo::path:
        source  => [ "puppet:///modules/site_sudo/sudoers/${::fqdn}/sudoers",
                     'puppet:///modules/site_sudo/sudoers/sudoers',
                     "puppet:///modules/sudo/sudoers/${::operatingsystem}/sudoers",
                     'puppet:///modules/sudo/sudoers/sudoers' ],
        require => Package['sudo'],
        owner   => root,
        group   => 0,
        mode    => '0440';
    }
  }
  file {
    $sudo::dir:
      ensure  => directory,
      require => Package['sudo'],
      owner   => root,
      group   => 0,
      mode    => '0550';
  }
}
