{% if grains['ipv4'][1] == "192.168.1.101" %}
myid: 1
{% endif %}
{% if grains['ipv4'][1] == "192.168.1.102" %}
myid: 2
{% endif %}
{% if grains['ipv4'][1] == "192.168.1.103" %}
myid: 3
{% endif %}
