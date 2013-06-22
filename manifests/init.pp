# manifests/init.pp - manage sudo stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class sudo(
  $deploy_sudoers = false,
  $dir = '/etc/sudoers.d'
) {
  case $::kernel {
    linux: { include sudo::linux }
    freebsd: { include sudo::freebsd }
    default: { include sudo::base }
  }
}
