include:
  - nginx.install

{% set nginx_user = 'www' %}

nginx_conf:
  file.managed:
    - name: /data/nginx/conf/nginx.conf
    - source: salt://nginx/file/nginx.conf
    - template: jinja
    - defaults:
      nginx_user: {{ nginx_user }}
      num_cpus: {{ grains['num_cpus'] }}
nginx_service :
  file.managed:
    - name: /etc/init.d/nginx
    - user: root
    - mode: 755
    - source: salt://nginx/file/nginx
  cmd.run:
    - names:
      - /sbin/chkconfig --add nginx
      - /sbin/chkconfig nginx on
    - unless: /sbin/chkconfig --list nginx
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: /data/nginx/conf/vhost/*.conf 
