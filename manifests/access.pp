define sudo::access (
  $ensure = 'present',
  $user = undef,
  $access = 'ALL=(ALL) ALL'
) {
  if $user == undef {
    $user = $name
  }
  # there shouldn't be a dot in those filenames!
  file { "${sudo::sudoersdir}/01-user_access-${title}":
    ensure  => 'present',
    owner   => 'root',
    group   => 0,
    mode    => '0440',
    content => "# THIS FILE IS MANAGED BY PUPPET !\n${user}        ${access}\n",
  }
}
