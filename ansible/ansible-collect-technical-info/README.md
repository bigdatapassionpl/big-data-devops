
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



## Plik z hostami

W pliku ```inventory``` wpisujemy nazwy hostów lub ich adresy IPv4/IPv6. Wartości są przykładowe, tutaj odwołanie się do swojego hosta, ale za pomocą połączenia (domyślnie) ssh.

```
[localhostmng]
localhost ansible_host=127.0.0.1
```

Opcjonalnie dzielimy sobie hosty na grupy. Po pierwsze primo, wygląda to estetyczne. Po drugie primo, jeśli każda grupa ma swoją konfigurację to podział jest konieczny. A po trzecie primo ultimo, best practices. Tutaj mamy dwie grupy: ```namenodes``` i ```datanodes```. Należy zauważyć, już tutaj możemy wskazać ich sposoby połączenia do maszyn (login, hasło-sic, typ połączenia, etc.)

```
[namenodes]
1.2.3.4
namenode.lan ansible_host=1.2.3.5 ansible_user=hadoop

[datanodes]
172.31.247.207 
inny.host.jakas-domena.pl ansible_host=172.31.247.207 ansible_user=radek
jakis.host.abc-domena-123.com ansible_host=172.31.247.208
```

Na końcu definiujemy dla wszystkich grup ogólne parametry, tutaj login do wykonywania zadań (uruchomienie playbooka lub wykonanie polecenia ad-hoc) to ```root```.

```
[all:vars]
ansible_user=root
```

## Plik z konfiguracją

W ```ansible.cfg``` możemy wymusić wykonywanie playbooka dla wskazanej wersji pythone, domyślnie jest to wersja wskazana przez nasz system. Wymuszanie wersji czasami jest potrzebne, gdy korzystamy z modułów nie bedących domyślnie zainstalowanych dla ansible. Możesz odhaszować ```interpreter_python``` i ```ansible_python_interpreter``` i zmienić ścieżki do plików.

Pozostałe parametry nie są bezpieczne, ale pomagają łatwiej przystosować się do wykonywania zadań.

* host_key_checking (działa tak samo jak ```StrictHostKeyChecking=no``` w połączeniu ssh)
* command_warnings (brak ostrzeżeń podczas uruchamiania niezalecanych modułów - takich bez kontroli stany zakończenia)
* force_valid_group_names (ignorowanie niezalecanych znaków w nazwach grup w ```inwentory```)

## Konfiguracja playbooka

Przykład skopiowania konfiguracji dla OSA

```
ansible-playbook -v -i inventory.osaweb shut-up-and-take-my-money.osaweb.yml
```

## WebUI ze statystykami

Instalacja sprowadza się do wydania polecenia

```
pip3 install ansible-cmdb
```

Po tym uruchamiamy skrypt ```shut-up-and-give-me-your-money.sh```. Po wykonaniu wykonujemy polecenie (skrypt sugeruje w ostatnich linijkach wykonania) do uruchomienia tymczasowego serwisu www do wyświetlenia wyniku pobierania danych. Można użyć np. nginx-a lub z palca uruchomić bardzo podstawowy serwer wyświetlania statycznego contentu. Przykład dla ```python``` w wersji ```2.x``` i ```3.x```.

```
python -m SimpleHTTPServer 8000
```

```
python3 -m http.server 8000
```

W przeglądarce uruchamiamy stronę http://127.0.0.1:8000/overview.html

