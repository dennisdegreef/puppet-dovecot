
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

  if $dovecot::lmtp {
    if $::operatingsystem == 'Debian' {
      package { 'dovecot-lmtpd':
        ensure => installed,
      }
    }
  }

  if $dovecot::use_mysql {
    if $::operatingsystem == 'Debian' {
      package { 'dovecot-mysql':
        ensure => installed,
      }
    }
  }
}