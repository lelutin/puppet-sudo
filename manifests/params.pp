class sudo::params {
  $dir = $::kernel ? {
    /freebsd/ => '/usr/local/etc/sudoers.d',
    default => '/etc/sudoers.d',
  }
  $path = $::kernel ? {
    /freebsd/ => '/usr/local/etc/sudoers',
    default => '/etc/sudoers',
  }
  $deploy_sudoers = false
}
