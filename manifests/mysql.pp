# manage configuration for dd-agent MySQL integration
define dd_agent::mysql(
  $server,
  $user           = undef,
  $pass           = undef,
  $port           = undef,
  $sock           = undef,
  $defaults_file  = undef,
  $replication    = undef,
  $galera_cluster = undef
) {

    # check if parent is available
    if !defined(Class['dd_agent']) {
      fail('The dd_agent base class must be included before this module can be used')
    }

    $app = 'mysql'

    file { "${dd_agent::config_dir}/${app}.yaml":
      ensure  => 'file',
      backup  => '.puppetold',
      content => template("dd_agent/${app}.yaml.erb"),
      replace => true,
      notify  => Service['datadog-agent']
    }

}