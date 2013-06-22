class sudo::base {
    if $sudo::deploy_sudoers {
      file {
        $sudo::path:
          source => [ "puppet:///modules/site_sudo/sudoers/${::fqdn}/sudoers",
                      "puppet:///modules/site_sudo/sudoers/sudoers",
                      "puppet:///modules/sudo/sudoers/${::operatingsystem}/sudoers",
                      "puppet:///modules/sudo/sudoers/sudoers" ],
          owner => root, group => 0, mode => 0440;
      }
    }
    file {
      $sudo::dir:
        ensure => directory,
        owner => root, group => 0, mode => 0550;
    }

}
