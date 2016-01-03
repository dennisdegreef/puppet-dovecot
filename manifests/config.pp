
class dovecot::config inherits dovecot {

  $real_verbose_proctitle = $dovecot::verbose_proctitle ? {
    true  => 'yes',
    false => 'no',
  }

  $real_shutdown_clients = $dovecot::shutdown_clients ? {
    true  => 'yes',
    false => 'no',
  }

  file { $dovecot::config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0640',
    content => template($dovecot::config_template),
    require => Package[$dovecot::package_name],
    notify  => Service[$dovecot::service_name],
  }

  if $dovecot::imap {
    file { "${dovecot::confd_dir}/20-imap.conf":
      ensure  => file,
      owner   => 0,
      group   => 0,
      mode    => '0640',
      content => template($dovecot::imap_config_template),
      notify  => Service[$dovecot::service_name],
    }
  }

  if $dovecot::ssl {
    $real_ssl = $dovecot::ssl ? {
      true  => 'yes',
      false => 'no',
    }

    $real_ssl_require_crl = $dovecot::ssl_require_crl ? {
      true  => 'yes',
      false => 'no',
    }

    $real_ssl_required = $dovecot::ssl_required ? {
      true  => 'required',
      false => 'yes',
    }

    $real_ssl_prefer_server_ciphers = $dovecot::ssl_prefer_server_ciphers ? {
      true  => 'yes',
      false => 'no',
    }

    file { "${dovecot::confd_dir}/10-ssl.conf":
      ensure  => file,
      owner   => 0,
      group   => 0,
      mode    => '0640',
      content => template($dovecot::ssl_config_template),
      notify  => Service[$dovecot::service_name],
    }
  }

  file { $dovecot::mail_location_root:
    ensure => directory,
    owner  => 0,
    group  => "mail",
    mode   => "0770",
  }
}
