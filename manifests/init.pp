
class dovecot (

  $package_name             = $dovecot::params::package_name,
  $package_manage           = $dovecot::params::package_manage,
  $package_ensure           = $dovecot::params::package_ensure,

  $service_name             = $dovecot::params::service_name,
  $service_manage           = $dovecot::params::service_manage,
  $service_enable           = $dovecot::params::service_enable,
  $service_ensure           = $dovecot::params::service_ensure,

  $config                   = $dovecot::params::config,
  $config_template          = $dovecot::params::config_template,
  $config_dir               = $dovecot::params::config_dir,
  $confd_dir                = $dovecot::params::confd_dir,

  $instance_name            = $dovecot::params::instance_name,
  $shutdown_clients         = $dovecot::params::shutdown_clients,
  $base_dir                 = $dovecot::params::base_dir,
  $verbose_proctitle        = $dovecot::params::verbose_proctitle,
  $greeting                 = $dovecot::params::greeting,

  $ssl                      = $dovecot::params::ssl,
  $ssl_required             = $dovecot::params::ssl_required,
  $ssl_config_template      = $dovecot::params::ssl_config_template,
  $ssl_cert                 = $dovecot::params::ssl_cert,
  $ssl_key                  = $dovecot::params::ssl_key,
  $ssl_key_password         = $dovecot::params::ssl_key_password,
  $ssl_require_crl          = $dovecot::params::ssl_require_crl,
  $ssl_ca                   = $dovecot::params::ssl_ca,
  $ssl_dh_parameters_length = $dovecot::params::ssl_dh_parameters_length,

  $imap                     = $dovecot::params::imap,
  $imap_config_template     = $dovecot::params::imap_config_template,
  $imap_max_line_length     = $dovecot::params::imap_max_line_length,
  $imap_logout_format       = $dovecot::params::imap_logout_format,

) inherits dovecot::params {

  validate_string($package_name)
  validate_string($package_ensure)
  validate_bool($package_manage)

  validate_string($service_name)
  validate_string($service_ensure)
  validate_bool($service_enable)
  validate_bool($service_manage)

  validate_string($config)
  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($config_dir)
  validate_absolute_path($config_dir)
  validate_string($confd_dir)
  validate_absolute_path($confd_dir)

  validate_string($instance_name)
  validate_bool($shutdown_clients)
  validate_string($base_dir)
  validate_absolute_path($base_dir)
  validate_bool($verbose_proctitle)
  validate_string($greeting)

  validate_bool($ssl)
  validate_string($ssl_config_template)
  validate_string($ssl_cert)
  validate_string($ssl_key)
  if $ssl_key_password != undef {
    validate_string($ssl_key_password)
    validate_absolute_path($ssl_key_password)
  }
  validate_bool($ssl_require_crl)
  validate_string($ssl_ca)
  validate_integer($ssl_dh_parameters_length)

  validate_bool($imap)
  validate_string($imap_config_template)
  validate_string($imap_max_line_length)
  validate_string($imap_logout_format)

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'dovecot::begin': } ->
  class { '::dovecot::install': } ->
  class { '::dovecot::config': } ~>
  class { '::dovecot::service': } ->
  anchor { 'dovecot::end': }

}