define oracle_as::forms::app (
  $oracle_home      = $oracle_as::oracle_home,
  $application_name = $name,
  $use_package      = true
  $version          = 'installed',
){

  if $use_package {
    package { $application_name :
      ensure => $version,
    }
  }

  concat::fragment { "as_forms_app-${name}" :
    target  => "${oracle_home}/forms/server/formsweb.cfg",
    order   => '02',
    content => template('oracle_as/forms_app_fragment.erb'),
  }

  file { "${application_name}-env" :
    ensure  => file,
    path    => '',
    content => template('oracle_as/forms_app_env.erb'),
  }
}
