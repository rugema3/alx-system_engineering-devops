# Install flask using puppet with pip3
exec { 'install_flask 2.1.0':
  command => 'pip3 install flask==2.1.0',
  unless  => 'pip3 show flask | grep "Version: 2.1.0"',
}
