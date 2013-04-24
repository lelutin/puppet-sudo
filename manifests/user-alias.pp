define sudo::extra-access($ensure = 'present', $user, $access) {
     file { "/etc/sudoers.d/01-user_access-$title":
       ensure  => $ensure,
       owner   => root,
       group   => root,
       mode    => 440,
       content => "# THIS FILE IS MANAGED BY PUPPET !\n\n$user        $access\n",
     }
     
}
