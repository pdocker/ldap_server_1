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
slaptest -d -1 -f slapd.conf -F /etc/openldap/slapd.d
slapadd -d -1 -F /etc/openldap/slapd.d -l referer.ldif
chown -R ldap.ldap /etc/openldap/certs/
chown -R ldap.ldap /etc/openldap/slapd.d/
chown -R ldap.ldap /var/lib/ldap/
