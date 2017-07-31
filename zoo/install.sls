zk_source:
  file.managed:
    - name: /data/zookeeper-3.4.9.tar.gz
    - source: salt://zk/zookeeper-3.4.9.tar.gz
    - unless: test -e /data/zookeeper-3.4.9.tar.gz

install:
  cmd.run:
    - cwd: /data
    - name: tar -xzf zookeeper-3.4.9.tar.gz
