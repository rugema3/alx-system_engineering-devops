# Define a class for Nginx installation and configuration
class nginx_server {

  # Install Nginx package
  package { 'nginx':
    ensure => installed,
  }

  # Configure Nginx to listen on port 80
  file { '/etc/nginx/sites-available/default':
    ensure => present,
    source => 'puppet:///modules/nginx_server/default',
    notify => Service['nginx'],
  }

  # Create the custom index file with "Hello World!"
  file { '/var/www/html/index.html':
    ensure  => present,
    content => 'Hello World!',
    notify  => Service['nginx'],
  }

  # Enable the default site by creating a symbolic link
  file { '/etc/nginx/sites-enabled/default':
    ensure => link,
    target => '/etc/nginx/sites-available/default',
    notify => Service['nginx'],
  }

  # Define a redirect resource
  nginx::resource::location { 'redirect_me':
    location      => '/redirect_me',
    rewrite_rule  => 'https://www.youtube.com/watch?v=QH2-TGUlwu4/ permanent',
  }

  # Ensure Nginx service is running and enabled
  service { 'nginx':
    ensure => running,
    enable => true,
  }
}

# Include the Nginx class
include nginx_server

