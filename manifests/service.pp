
class dovecot::service inherits dovecot {

  if ! ($dovecot::service_ensure in [ 'running', 'stopped' ]) {
    fail('dovecot::service_ensure parameter must be running or stopped')
  }

  if $dovecot::service_manage == true {
    service { $dovecot::service_name:
      ensure     => $dovecot::service_ensure,
      enable     => $dovecot::service_enable,
      name       => $dovecot::service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
