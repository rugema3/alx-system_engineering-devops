# Install Nginx
exec { 'update':
  command => 'sudo apt-get -y update',
  path    => ['/usr/bin', '/usr/sbin'],
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

# Create a custom Nginx configuration file
file { '/etc/nginx/sites-available/custom_header':
  ensure  => 'file',
  content => "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By \$hostname;
    root   /var/www/html;
    index  index.html index.htm;

    location /redirect_me {
        return 301 http://cuberule.com/;
    }

    error_page 404 /404.html;
    location = /404.html {
      root /var/www/html;
      internal;
    }
}",
  require => Package['nginx'],
}

# Create a symbolic link to enable the custom configuration
file { '/etc/nginx/sites-enabled/custom_header':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/custom_header',
  require => File['/etc/nginx/sites-available/custom_header'],
}

# Create the default HTML file with your content
file { '/var/www/html/index.nginx-debian.html':
  ensure  => 'file',
  content => 'Hello World!',
  require => Package['nginx'],
}

# Create the custom 404.html file with the message
file { '/var/www/html/404.html':
  ensure  => 'file',
  content => "Ceci n'est pas une page",
  require => Package['nginx'],
}

# Ensure Nginx is running and enabled at boot
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  require   => [
    File['/etc/nginx/sites-available/custom_header'],
    File['/var/www/html/index.nginx-debian.html'],
    File['/var/www/html/404.html'],
  ],
}

