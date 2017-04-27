#!/bin/bash

rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp DB_CONFIG /var/lib/ldap/
cp -r nsswitch.conf /etc/nsswitch.conf
slaptest -f slapd-edt.org.conf -F /etc/openldap/slapd.d
slapadd -F /etc/openldap/slapd.d -l organitzacio_edt.ldif
slapadd -F /etc/openldap/slapd.d -l usuaris_tots.ldif
chown -R ldap.ldap /etc/openldap/slapd.d/
chown -R ldap.ldap /var/lib/ldap/

