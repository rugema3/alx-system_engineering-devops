# Define a resource block for managing a file with the path /tmp/school
file { '/tmp/school':
  # Ensure that the resource represents a file
  ensure  => 'file',

  # Set the file permissions to 0744
  mode    => '0744',

  # Set the owner of the file to www-data
  owner   => 'www-data',

  # Set the group of the file to www-data
  group   => 'www-data',

  # Specify the content that should be written to the file
  content => 'I love Puppet',
}
