nginx_pre:
 pkg.installed:
  - pkgs: 
    - pcre-devel
    - zlib-devel
    - openssl-devel

nginx_source:
 file.managed:
  - name: /tmp/nginx-1.12.1.tar.gz
  - unless: test -e /tmp/nginx-1.12.1.tar.gz
  - source: salt://nginx/nginx-1.12.1.tar.gz

nginx_extract:
 cmd.run:
  - cwd: /tmp
  - names:
    - tar xzf nginx-1.12.1.tar.gz
  - unless: test -d /tmp/nginx-1.12.1
  - require:
    - file: nginx_source

nginx_user:
  user.present:
    - name: www
    - createhome: False
    - gid_from_name: True
    - shell: /sbin/nologin

nginx_compile:
  cmd.run:
    - cwd: /tmp/nginx-1.12.1
    - names:
      - ./configure --user=www --group=www --prefix=/data/nginx --with-http_stub_status_module --with-http_gzip_static_module --with-http_ssl_module --with-http_realip_module
      - make
      - make install
    - require:
      - cmd: nginx_extract
      - pkg: nginx_pre
    - unless: test -d /data/nginx

create_dir:
  cmd.run:
    - names:
      - mkdir -p /data/www
      - chown -R www.www /data/www
      - mkdir -p /data/nginx/conf/vhost
    - unless: test -d /usr/local/nginx/conf/vhost
    - require: 
      - cmd: nginx_compile 

