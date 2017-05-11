#!/bin/bash

rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp DB_CONFIG /var/lib/ldap/
cp -r nsswitch.conf /etc/
cp -r ldap.conf /etc/
cp -r ldap.conf /etc/openldap/
cp cacert.pem /etc/openldap/certs/
cp cakey.pem /etc/openldap/certs/
cp servercert.pem /etc/openldap/certs/
cp serverkey.pem /etc/openldap/certs/
cp identity.schema /etc/openldap/schema/identity.schema
chmod 650 /etc/openldap/certs/*
slaptest -f slapd.conf -F /etc/openldap/slapd.d
slapadd -F /etc/openldap/slapd.d -l organitzacio_usuaris_edt.ldif
chown -R ldap.ldap /etc/openldap/certs/
chown -R ldap.ldap /etc/openldap/slapd.d/
chown -R ldap.ldap /var/lib/ldap/
