nginx_pre:
 pkg.installed:
  - pkgs: 
  - pcre-devel
  - zlib
nginx_source:
 file.managed:
  - name: /tmp/nginx-1.12.1.tar.gz
  - unless: test -e /tmp/nginx-1.12.1.tar.gz
  
