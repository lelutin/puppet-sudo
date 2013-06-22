class sudo::freebsd inherits sudo::base {

    class { 'sudo': dir => '/usr/local/etc/sudoers.d' }
    package{'sudo':
        ensure => installed,
    }

    if $sudo_deploy_sudoers {
      File['/etc/sudoers']{
        path => "/usr/local/etc/sudoers",
        require => Package['sudo'],
      }
    }
}
