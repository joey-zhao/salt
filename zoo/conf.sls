conf:
  file.managed:
    - source: salt://zoo/conf/zoo.cfg
    - name: /data/zookeeper-3.4.9/conf/zoo.cfg
    - template: jinja

id:
  cmd.run:
    - name: echo {{ pillar['myid'] }} > /data/zookeeper-dat/data/myid
