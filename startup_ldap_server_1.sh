#!/bin/bash
echo "Carregant servidor LDAP..."
docker build --no-cache -t ldap.edt.org . 2>> error.log >> status.log
docker run --name ldap.edt.org --hostname ldap.edt.org --detach ldap.edt.org 2>> error.log >> status.log
echo "Carregat!"
docker exec -it ldap.edt.org bash



