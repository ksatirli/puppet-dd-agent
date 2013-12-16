# manage configuration for dd-agent HAProxy integration
defineasd dd_agent::haproxy(
  $username,
  $password,
  $url,
  $status_check
) {

    # check if parent is available
    if !defined(Class['dd_agent']) {
      fail('The dd_agent base class must be included before this module can be used')
    }

    $app = 'haproxy'

    file { "${dd_agent::config_dir}/${app}.yaml":
      ensure  => 'file',
      backup  => '.puppetold',
      content => template("dd_agent/${app}.yaml.erb"),
      replace => true,
      notify  => Service['datadog-agent']
    }

}