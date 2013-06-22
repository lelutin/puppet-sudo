class sudo::freebsd inherits sudo::base {
    package{'sudo':
        ensure => installed,
    }
}
