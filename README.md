
# Big Data DevOps

Stworzony przez BigDataPassion.pl

## Adresy URL maszyn wirtualnych

* Kafka
    * http://rest-proxy:8082/
    * http://schema-registry:8085/
    * http://kafka-topics-ui:8000/
    * http://schema-registry-ui:8001/
    * http://kafka-manager:9000/
    
## Wpisy w /etc/hosts

~~~bash
172.22.0.2 zookeeper
172.22.0.3 kafka1
172.22.0.4 kafka2
172.22.0.5 kafka3
172.22.0.6 kafka-manager
172.22.0.7 schema-registry
172.22.0.8 rest-proxy
172.22.0.9 kafka-topics-ui
172.22.0.10 schema-registry-ui
~~~

## Ansible - pobieranie konfiguracji + informacji o hostach

Katalog ```ansible-collect-technical-info```.

* shut-up-and-give-me-your-money.sh - skrypt do wizualizacji zasobów
* shut-up-and-take-my-money.yml - playbook do tworrzenia kopii konfiguracji

### miniHOWTO

```
git clone git@github.com:bigdatapassionpl/big-data-devops.git
cd big-data-devops/ansible-collect-technical-info/
# edytujemy plik z inwentarzem inventory
./shut-up-and-give-me-your-money.sh
python -m SimpleHTTPServer 8000
# otwieramy w przeglądarce http://127.0.0.1:8000/overview.html
```

