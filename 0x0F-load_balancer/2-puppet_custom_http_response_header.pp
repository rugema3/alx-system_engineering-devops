# 2-puppet_custom_http_response_header.pp

# Install Nginx
class { 'nginx': }

# Define the custom Nginx configuration
file { '/etc/nginx/sites-available/custom_header':
  ensure  => 'file',
  content => "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By $hostname;
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
}

# Create a symbolic link to enable the custom configuration
file { '/etc/nginx/sites-enabled/custom_header':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/custom_header',
}

# Create the default HTML file with your content
file { '/var/www/html/index.nginx-debian.html':
  ensure  => 'file',
  content => 'Hello World!',
}

# Create the custom 404.html file with the message
file { '/var/www/html/404.html':
  ensure  => 'file',
  content => "Ceci n'est pas une page",
}

# Ensure Nginx is running and enabled at boot
service { 'nginx':
  ensure  => 'running',
  enable  => true,
}
