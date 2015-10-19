
class dovecot::service inherits dovecot {

  if ! ($dovecot::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $dovecot::service_manage == true {
    service { 'dovecot':
      ensure     => $dovecot::service_ensure,
      enable     => $dovecot::service_enable,
      name       => $dovecot::service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}