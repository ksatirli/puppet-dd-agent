# manage configuration for dd-agent Gearmand integration
defineasd dd_agent::gearmand(
  $server,
  $port,
  $tags     = undef
) {

    # check if parent is available
    if !defined(Class['dd_agent']) {
      fail('The dd_agent base class must be included before this module can be used')
    }

    $app = 'gearmand'

    file { "${dd_agent::config_dir}/${app}.yaml":
      ensure  => 'file',
      backup  => '.puppetold',
      content => template("dd_agent/${app}.yaml.erb"),
      replace => true,
      notify  => Service['datadog-agent']
    }

}