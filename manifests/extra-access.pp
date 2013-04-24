define sudo::extra-access($ensure = 'present', $user = undef, $access = 'ALL=(ALL) ALL') {
     if $user == undef {
       $user = $name
     }
     # there shouldn't be a dot in those filenames!
     file { "/etc/sudoers.d/01-user_access-${name}":
       ensure  => 'present',
       owner   => root,
       group   => root,
       mode    => 0440,
       content => "# THIS FILE IS MANAGED BY PUPPET !\n${user}        ${access}\n",
     }
}
