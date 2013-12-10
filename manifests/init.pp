# manages configuration for dd-agent
class dd_agent {

  # check if base module is available, see http://in.structed.io/J83i0s
  include datadog

  $config_dir = '/etc/dd-agent/conf.d'

}