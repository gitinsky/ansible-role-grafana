# Grafana


```yml
- hosts: vagrant
  become: yes
  roles:
    - role: grafana
      grafana_beta: yes
```

See [defaults](defaults/main.yml) for available options, check out supported platforms at molecule [settings](molecule.yml).
