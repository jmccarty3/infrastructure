node "builder.localdomain"{
  package{"cmake": }
}


node "repo.localdomain"{
  package{"nginx": }
  
  # Base Directory shortcut
  $basedir = '/var/lib/apt/repo'

  # Main reprepro class
  class { 'reprepro':
    basedir => $basedir,
  }

  # Set up a repository
  reprepro::repository { 'localpkgs':
    ensure  => present,
    basedir => $basedir,
    options => ['basedir .'],
  }

  # Create a distribution within that repository
  reprepro::distribution { 'precise':
    basedir       => $basedir,
    repository    => 'localpkgs',
    origin        => 'Foobar',
    label         => 'Foobar',
    suite         => 'precise',
    architectures => 'amd64 i386',
    components    => 'main contrib non-free',
    description   => 'Package repository for local site maintenance',
    sign_with     => 'F4D5DAA8',
    not_automatic => 'No',
 }

  #class{ 'nginx' : }

  include ::nginx::config
  include ::nginx::service
  #create a test site
  nginx::resource::vhost { 'test':
    ensure      => present,
    server_name => ['test'],
    listen_port => 80,
    www_root    => '/var/www/www.testit.com',
  }
 
 include repo_server 
}
