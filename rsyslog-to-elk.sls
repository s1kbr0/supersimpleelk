/etc/rsyslog.d/forward-all-to-elk_.conf:
  file.managed:
    - source: salt://files/rsyslog-to-elk
