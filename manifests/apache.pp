# manage configuration for dd-agent Apache integration
define dd_agent::apache(
  $apache_status_url,
  $apache_user,
  $apache_password,
  $tags) {

  $app = 'apache'

  include dd_agent

  include dd_agent::check_file($app)

  file { "${app}.yaml":
    ensure  => 'exists',
    path    => "${dd_agent::config_dir}/${app}.yaml",
    content => template("dd_agent/${app}.yaml.erb")
    replace => true
  }

}