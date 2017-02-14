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