class oracle_as::httpd(
  $ensure      = 'running',
  $oracle_home = $oracle_as::oracle_home,
){

  file { ["${oracle_home}/Apache", "${oracle_home}/Apache/Apache", "${oracle_home}/Apache/Apache/conf"] :
    ensure => directory,
  }

  service {'oracle_as_httpd':
    ensure  => $ensure,
    start   => '',
    stop    => '',
    restart => '',
    status  => '',
  }
}
