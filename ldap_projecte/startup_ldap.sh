#!/bin/bash

rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp DB_CONFIG /var/lib/ldap/
cp -r nsswitch.conf /etc/
cp -r ldap.conf /etc/
cp cacert.pem /etc/openldap/certs/
cp servercert.pem /etc/openldap/certs/
cp serverkey.pem /etc/openldap/certs/
cp identity.schema /etc/openldap/schema/identity.schema
chmod 600 /etc/openldap/certs/serverkey.pem
slaptest -f slapd-edt.org.conf -F /etc/openldap/slapd.d
slapadd -F /etc/openldap/slapd.d -l organitzacio_usuaris_edt.ldif
chown -R ldap.ldap /etc/openldap/slapd.d/
chown -R ldap.ldap /var/lib/ldap/
