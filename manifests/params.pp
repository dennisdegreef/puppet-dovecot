
class dovecot::params {

  $package_name             = $::operatingsystem ? {
    /(?i:FreeBSD)/ => 'dovecot2',
    default        => 'dovecot-core'
  }

  $package_manage           = true
  $package_ensure           = installed

  $service_name             = 'dovecot'
  $service_manage           = true
  $service_enable           = true
  $service_ensure           = running

  $etc_directory            = $::operatingsystem ? {
    /(?i:FreeBSD)/ => '/usr/local/etc',
    default        => '/etc',
  }

  $config_dir               = "${etc_directory}/dovecot"
  $confd_dir                = "${config_dir}/conf.d"

  $config                   = "${config_dir}/dovecot.conf"
  $config_template          = 'dovecot/dovecot.conf.erb'

  $instance_name            = 'dovecot'
  $shutdown_clients         = true
  $base_dir                 = '/var/run/dovecot/'
  $verbose_proctitle        = false
  $greeting                 = 'Dovecot ready.'

  $ssl                      = false
  $ssl_required             = false
  $ssl_config_template      = 'dovecot/ssl.conf.erb'
  $ssl_cert                 = "${config_dir}/dovecot.pem"
  $ssl_key                  = "${config_dir}/private/dovecot.pem"
  $ssl_key_password         = undef
  $ssl_require_crl          = true
  $ssl_ca                   = undef
  $ssl_dh_parameters_length = 2048 # dont logjam

  $imap                     = false
  $imap_config_template     = 'dovecot/imap.conf.erb'
  $imap_max_line_length     = '64k'
  $imap_logout_format       = 'in=%i out=%o'

}