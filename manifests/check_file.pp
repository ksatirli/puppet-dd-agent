# checks for existance of dd-agent configuration and creates backup as needed
define dd_agent::check_file($app = $title) {

  include dd_agent

  file { "${app}.yaml":
    ensure  => 'exists',
    path    => "${dd_agent::config_dir}/${app}.yaml",
    backup  => true
  }

}