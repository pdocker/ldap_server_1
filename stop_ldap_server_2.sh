#!/bin/bash
echo "Esborrant docker..."
docker rm ldapsub.edt.org 2&> /dev/null
docker rmi ldapsub.edt.org 2&> /dev/null
echo "Esborrat!"
