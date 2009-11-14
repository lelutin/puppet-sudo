# manifests/init.pp - manage sudo stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

class sudo {
    case $kernel {
        linux: { include sudo::linux }
        default: { include sudo::base }
    }
}
