# Dovecot Puppet module
[![Build Status](https://travis-ci.org/link0/puppet-dovecot.svg?branch=master)](https://travis-ci.org/link0/puppet-dovecot)

Puppet module to manage Dovecot servers

## Features

## Supported OS

* Ubuntu
* Debian
* FreeBSD

## Dependencies

## Example

```puppet

  class { '::dovecot':
    config_template => 'different/module/custom.conf.erb'
  }
```


# Contributions

Pull requests are very welcome. Join [these fine folks](https://github.com/link0/puppet-dovecot/graphs/contributors) who already helped to get this far with this module.

**To help guaranteeing the stability of the module, please make sure to add tests to your pull request.**
