define sudo::access (
  $ensure = 'present',
  $user = undef,
  $access = 'ALL=(ALL) ALL'
) {
  include sudo
  if $user == undef {
    $real_user = $name
  } else {
    $real_user = $user
  }
  # there shouldn't be a dot in those filenames!
  file { "${sudo::dir}/01-user_access-${title}":
    ensure  => 'present',
    owner   => 'root',
    group   => 0,
    mode    => '0440',
    content => "# THIS FILE IS MANAGED BY PUPPET !\n${real_user}        ${access}\n",
  }
}
