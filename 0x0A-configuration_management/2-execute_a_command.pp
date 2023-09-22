exec { 'kill_killmenow_process':
  command => '/usr/bin/pkill -f killmenow',
}
