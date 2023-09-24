exec { 'configure_ssh_client':
  command => 'echo -e "IdentityFile ~/.ssh/school\nPasswordAuthentication no" | tee -a /etc/ssh/ssh_config',
  unless  => 'grep -qE "^\s*IdentityFile\s+~/.ssh/school" /etc/ssh/ssh_config && grep -qE "^\s*PasswordAuthentication\s+no" /etc/ssh/ssh_config',
  require => File['/etc/ssh/ssh_config'],
}

