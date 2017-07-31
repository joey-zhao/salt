/data:
  file.directory:
    - makedirs: True

jdk_source:
  file.managed:
    - name: /data/jdk.tar.gz
    - unless: test -e /data/jdk.tar.gz
    - source: salt://jdk/jdk7u79linuxx64.tar.gz

install:
  cmd.run:
    - cwd: /data
    - name: tar -xzf jdk.tar.gz && mv /data/jdk1.7.0_79 /data/jdk && /bin/ln -s jdk jdk_latest
    - unless: /data/jdk

/etc/profile:
  file.append:
    - text:
      - export JAVA_HOME=/data/jdk_latest
      - export PATH=$JAVA_HOME/bin:$PATH
      - export CLASSPATH=$JAVA_HOME/lib/
