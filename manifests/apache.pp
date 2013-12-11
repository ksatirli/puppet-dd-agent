# manage configuration for dd-agent Apache integration
define dd_agent::apache(
  $apache_status_url,
  $apache_user      = undef,
  $apache_password  = undef,
  $tags             = undef) {

  # check if parent is available
  if !defined(Class['dd_agent']) {
    fail('The dd_agent base class must be included before this module can be used')
  }

  $app = 'apache'

  file { "${dd_agent::config_dir}/${app}.yaml":
    ensure  => 'file',
    backup  => '.puppetold',
    content => template("dd_agent/${app}.yaml.erb"),
    replace => true,
    notify  => Service['datadog-agent']
  }

}