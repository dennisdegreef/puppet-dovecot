
class dovecot::install inherits dovecot {
  if $dovecot::package_manage {
    package { $dovecot::package_name:
      ensure => $dovecot::package_ensure,
    }
  }

  if $dovecot::imap {
    if $::operatingsystem == 'Debian' {
      package { 'dovecot-imapd':
        ensure => installed,
      }
    }
  }
}