
## Wrzucenie plików

Oktawawe:
~~~bash
for i in {1..5..1}; do scp -r iptables-up.sh hdp${i}://tmp; done
for i in {1..5..1}; do scp -r white-list.txt hdp${i}://tmp; done
~~~