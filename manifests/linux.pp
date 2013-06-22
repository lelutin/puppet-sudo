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
