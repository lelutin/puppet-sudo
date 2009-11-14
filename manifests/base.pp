class sudo::base {
    if $sudo_deploy_sudoers {
      file{'/etc/sudoers':
        source => [ "puppet://$server/modules/site-sudo/sudoers/${fqdn}/sudoers",
                    "puppet://$server/modules/site-sudo/sudoers/sudoers",
                    "puppet://$server/modules/sudo/sudoers/${operatingsystem}/sudoers",
                    "puppet://$server/modules/sudo/sudoers/sudoers" ],
        owner => root, group => 0, mode => 0440;
      }
    }
}
