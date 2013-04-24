define sudo::extra-access($ensure = 'present', $user, $access = 'ALL=(ALL) ALL') {
     file { "/etc/sudoers.d/01-user_access-$title":
       ensure  => 'present',
       owner   => root,
       group   => admin,
       mode    => 640,
       content => "# THIS FILE IS MANAGED BY PUPPET !\n\n$user        $access\n",
     }
}
