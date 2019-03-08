# NTP Ansible Role

[![Build Status](https://travis-ci.org/bdclark/ansible-ntp.svg?branch=master)](https://travis-ci.org/bdclark/ansible-ntp)

Install and configure NTP and timezone.

Requirements
------------
This role is tested with the following Ansible versions and operating systems:

- Ansible 2.5, 2.7
- Ubuntu 16.04, 18.04
- Centos 7.x

Role Variables
--------------
See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.

Examples
----------------
```yaml
- hosts: all
  roles:
    - role: ntp
```
