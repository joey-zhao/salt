minion_conf:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://minion/conf/minion
    - user: root
    - group: root
    - mode: 640
minion_service:
  service.running:
    - name: salt-minion
    - enable: True
    - require:
      - file: minion_conf
