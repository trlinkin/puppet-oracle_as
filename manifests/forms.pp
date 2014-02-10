class oracle_as::forms (
  $oracle_home                = $oracle_as::oracle_home,
  $default_basehtml           = 'base.htm',
  $default_basehtmljinitiator = 'basejini.htm',
) {

  file { ["${oracle_home}/forms", "${oracle_home}/forms/server"] :
    ensure => 'directory',
  }

  concat { 'formsweb.cfg' :
    ensure => present,
    path   => "${oracle_home}/forms/server/formsweb.cfg",
  }

  concat::fragment { 'formsweb.cfg_defaults' :
    target  => "${oracle_home}/forms/server/formsweb.cfg",
    order   => '01',
    content => template('oracle_as/formsweb.cfg-defaults.erb'),
  }

}
