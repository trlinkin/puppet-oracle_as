class oracle_as::httpd(
  $ensure      = 'running',
  $oracle_home = $oracle_as::oracle_home,
){

  file { ["${oracle_home}/Apache", "${oracle_home}/Apache/Apache", "${oracle_home}/Apache/Apache/conf"] :
    ensure => directory,
  }

  service {'oracle_as_httpd':
    ensure  => $ensure,
    start   => "${oracle_home}/bin/opmnctl startproc ias-component=HTTP_Server",
    stop    => "${oracle_home}/bin/opmnctl stopproc ias-component=HTTP_Server",
    restart => "${oracle_home}/bin/opmnctl restartproc ias-component=HTTP_Server",
    status  => "${oracle_home}/bin/opmnctl status",
  }
}
