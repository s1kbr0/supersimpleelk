elasticsearch-1.5.2.tar.gz:
  archive.extracted:
    - archive_format: tar
    - tar_options: z
    - name: /opt/
    - if_missing: /opt/elasticsearch-1.5.2
    - source: https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz
    - source_hash: sha1=ffe2e46ec88f4455323112a556adaaa085669d13

logstash-1.5.0.tar.gz:
  archive.extracted:
    - archive_format: tar
    - tar_options: z
    - name: /opt/
    - if_missing: /opt/logstash-1.5.0
    - source: http://download.elastic.co/logstash/logstash/logstash-1.5.0.tar.gz
    - source_hash: sha1=9729c2d31fddaabdd3d8e94c34a6d1f61d57f94a

kibana-4.4.1-linux-x64.tar.gz:
  archive.extracted:
    - archive_format: tar
    - tar_options: z
    - name: /opt/
    - if_missing: /opt/kibana-4.1.1-linux-x64
    - source: https://download.elastic.co/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz
    - source_hash: sha1=d43e039adcea43e1808229b9d55f3eaee6a5edb9

/etc/init/logstash.conf:
  file.managed:
    - source: salt://files/upstart--logstash

/etc/init/elasticsearch.conf:
  file.managed:
    - source: salt://files/upstart--elasticsearch


/opt/logstash-1.5.0/conf:
  file.directory:
    - makedirs: True

/opt/logstash-1.5.0/conf/logstash-simple.conf:
  file.managed:
    - source: salt://files/logstash-simple.conf

/opt/kibana-4.1.1-linux-x64/config/kibana.yml:
  file.managed:
    - source: salt://files/kibana-config


logstash:
  service.running:
    - enable: True

elasticsearch:
  service.running:
    - enable: True


/etc/ssl/elk01.example.com_.key:
  file.managed:
    - source: salt://files/elk01.example.com_.key

/etc/ssl/elk01.example.com_.cert:
  file.managed:
    - source: salt://files/elk01.example.com_.cert


/opt/htpasswd:
  file.managed:
    - source: salt://files/elk-htpasswd

/www/log:
  file.directory:
    - makedirs: True
