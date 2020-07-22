#!/bin/bash

export PATH=${PATH}:~/.local/bin:~/.local/lib/python3.7/site-packages/
mkdir -p cmdbout
ansible -m setup --tree cmdbout/ all
ansible-cmdb cmdbout/ > overview.html
echo RUN python -m SimpleHTTPServer 8000
echo GO! http://127.0.0.1:8000/overview.html

