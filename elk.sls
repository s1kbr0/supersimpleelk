elasticsearch-1.5.2.tar.gz:
  archive.extracted:
    - archive_format: tar
    - tar_options: z
    - name: /opt/
    - if_missing: /opt/elasticsearch-1.5.2
    - source: https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.tar.gz

logstash-1.5.0.tar.gz:
  archive.extracted:
    - archive_format: tar
    - tar_options: z
    - name: /opt/
    - if_missing: /opt/logstash-1.5.0
    - source: http://download.elastic.co/logstash/logstash/logstash-1.5.0.tar.gz


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

/opt/kibana-4.0.2-linux-x64/config/kibana.yml:
  file.managed:
    - source: salt://files/kibana-config


logstash:
  service.running:
    - enable: True

elasticsearch:
  service.running:
    - enable: True


/etc/ssl/elk01.staging.example.com_.key:
  file.managed:
    - source: salt://files/elk01.staging.example.com_.key

/etc/ssl/elk01.staging.example.com_.cert:
  file.managed:
    - source: salt://files/elk01.staging.example.com_.cert


/opt/htpasswd:
  file.managed:
    - source: salt://files/elk-htpasswd

/www/log:
  file.directory:
    - makedirs: True
