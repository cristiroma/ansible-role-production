Role Name
=========

Base CentOS setup for production purposes

Requirements
------------

None

Role Variables
--------------

```
server_hostname: "paladin"
system_timezone: "/usr/share/zoneinfo/Europe/Bucharest"
root_email_alias: "sysadmin@company.com"
users_system:
  - { username: "sysadmin", group: "wheel", groups: "users", shell: "/bin/bash", state: "present", append: "yes", comment: "system administrator" }
  - { username: "deploy", group: "apache", groups: "users", shell: "/bin/bash", state: "present", append: "yes", comment: "deploy account" }
sshd_authorized_keys: []
  - { username: "sysadmin", key: "{{ lookup('file', 'files/openssh-keys/john.pub') }}", state: "present" }
  - { username: "sysadmin", key: "{{ lookup('file', 'files/openssh-keys/mike.pub') }}", state: "present" }
  - { username: "deploy", key: "{{ lookup('file', 'files/openssh-keys/rihanna.pub') }}", state: "present" }
  - { username: "deploy", key: "{{ lookup('file', 'files/openssh-keys/paul.pub') }}", state: "present" }
```

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```
    - hosts: servers
      roles:
         - { role: cristiroma.production }
```

License
-------

BSD

Author Information
------------------

@cristiroma