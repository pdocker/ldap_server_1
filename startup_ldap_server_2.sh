#!/bin/bash
echo "Carregant servidor LDAP..."
docker build --no-cache -t ldapsub.edt.org . 2>> error.log >> status.log
docker run --name ldapsub.edt.org --hostname ldapsub.edt.org --detach ldapsub.edt.org 2>> error.log >> status.log
echo "Carregat!"
docker exec -it ldapsub.edt.org bash



