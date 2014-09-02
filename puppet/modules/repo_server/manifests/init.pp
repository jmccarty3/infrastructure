class repo_server {

    class { 'apt_mirror':}

    apt_mirror::mirror { 'puppetlabs':
        mirror  => 'apt.puppetlabs.com',
        os      => '',
        release => 'precise',
        components => ['main'],
    }

    apt_mirror::mirror { 'ubuntu_precise':
        mirror  => 'archive.ubuntu.com',
        os      => '',
        release => 'precise',
        components => ['main'],
    }
}
