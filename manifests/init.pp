# manifests/init.pp - manage sudo stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class sudo {
    case $operatingsystem {
        default: { include sudo::base }
    }
}

class sudo::base {
    package{'sudo':
        ensure => installed,
    }
}
