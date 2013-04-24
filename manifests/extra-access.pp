define sudo::extra-access($user, $access) {
     file { "/etc/sudoers.d/$user":
       ensure  => 'present',
       owner   => root,
       group   => admin,
       mode    => 640,
       content => "$user	$access",
       notify  => Service[apache2]
     }
}
