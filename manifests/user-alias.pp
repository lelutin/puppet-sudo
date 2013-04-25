define sudo::user-alias (
  $members,
  $ensure = 'present'
) {
  # this is 00-prefixed so that it's defined before the other definitions
  file { "/etc/sudoers.d/00-user_alias-${title}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 0,
    mode    => '0440',
    content => "# THIS FILE IS MANAGED BY PUPPET !\n\nUser_Alias ${name} = ${members}\n",
  }
}
