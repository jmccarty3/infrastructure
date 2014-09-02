class linux_builder {

    $packages=['vim', 'build-essential']

    package{$packages:
        ensure => installed,
    }

}
