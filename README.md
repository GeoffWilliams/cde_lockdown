[![Build Status](https://travis-ci.org/GeoffWilliams/cde_lockdown.svg?branch=master)](https://travis-ci.org/GeoffWilliams/cde_lockdown)
# cde_lockdown

#### Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Lockdown the CDE on Aix and Solaris buy restricting permissions and altering banner messages

## Setup

### What cde_lockdown affects
* Set inactivity timeouts for CDE by writing files to /etc/dt/config for each locale in the /usr/dt/config directory
* Ensure files under /etc/dt have correct permissions
* Alter the default banner messages to prevent information disclosure
* Disable remote logins
* Remove SUID/SGID from CDE binaries
* Lock down /etc/dt/confg/Xservers if it exists

## Usage

### General permissions and banner messages

```puppet
class { "cde_lockdown":
  banner_title   => "Authorised users only",
  banner_message => "Get off my lawn",
}
```

### Prevent remote logins

```puppet
include cde_lockdown::remote
```

### Remove SUID

```puppet
include cde_lockdown::suid
```

### Explicit Xserver in Xconfig

```puppet
include cde_lockdown::xservers
```

### Suggested overall system usage

```puppet
class { "cde_lockdown":
  banner_title   => "Authorised users only",
  banner_message => "Get off my lawn",
}
include cde_lockdown::suid
include cde_lockdown::remote
include cde_lockdown::xservers
```
This will lock-down CDE to the extent possible using this module.  Users are free to pick and choose classes to suit their needs.

## Reference

### Classes
* `cde_lockdown` - banners and general permissions
* `cde_lockdown::remote` - disable remote access
* `cde_lockdown::suid` - remove suid
* `cde_lockdown::xservers` - explicit Xserver

### Facts
* `cde_installed` - Detects the presence of CDE by checking for the presence of the `/usr/dt/config` directory

## Limitations

* Does not remove or disable CDE, only restrict it somewhat
* AIX and Solaris only
* Not supported by Puppet, Inc.

## Development

PRs accepted :)

## Testing
This module supports testing using [PDQTest](https://github.com/GeoffWilliams/pdqtest).


Test can be executed with:

```
bundle install
bundle exec pdqtest all
```


See `.travis.yml` for a working CI example
