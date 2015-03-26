# Clone

```
git clone https://github.com/gitinsky/ansible-role-grafana.git roles/grafana
```

# Variables

Check ```dafaults/main.yml``` for the whole list and for the default values.

* ```es_password``` is your plain text password for basic authorization
* ```grafana_http_hash``` is your hash for basic authorization. If this variable is not set ansible will try to generate hash with python on your local system
* ```grafana_https_enabled``` if set, forces https usage, also requires ```certificates``` role. Set to ```false``` by default for backward compatibility.
* ```grafana_https_proxy_enabled``` is ```false``` by default. Set it to ```true``` if you implement https support outside this role (with an nginx proxy, for example).

# Tags

* ```config``` – tested only for nginx changes

# Notes
Tested on ansible 1.8.4, applied to ubuntu 14.04.

