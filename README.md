# Clone

```
git clone https://github.com/gitinsky/ansible-role-grafana.git roles/grafana
```

```yml
- hosts: vagrant
  become: yes
  roles:
    - { role: grafana, grafana_http_port: 2000 }
```
