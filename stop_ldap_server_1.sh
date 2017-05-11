#!/bin/bash
echo "Esborrant docker..."
docker rm ldap.edt.org 2&> /dev/null
docker rmi ldap.edt.org 2&> /dev/null
echo "Esborrat!"
