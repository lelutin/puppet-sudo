define sudo::user-alias ($ensure = 'present', $members) {
     file { "/etc/sudoers.d/00-user_alias-$title":
       ensure  => $ensure,
       owner   => root,
       group   => root,
       mode    => 440,
       content => "# THIS FILE IS MANAGED BY PUPPET !\n\nUser_Alias $name = $members\n",
     }
}
