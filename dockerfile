# Fitxer base de dockerfile ldap
FROM fedora:24

#Autor
MAINTAINER "Pablo Prieto Asensio"

# Basic Installations
RUN dnf update vi
RUN dnf -y install \
	nmap\
	procps\
	iproute\
	iputils\
	passwd\
	man-db\
	tree\
	vim\  
	openldap\
	openldap-servers\
	openldap-clients\
	nss-pam-ldapd\
	cyrus-sasl-ldap\
	krb5-server-ldap

# Set Work Directory
WORKDIR /opt/ldap_files

# Copy directory
COPY ldap_files/* /opt/ldap_files/

# Execute ldap script
RUN chmod +x startup_ldap.sh
RUN bash startup_ldap.sh

# Open de necessary ports
EXPOSE 389

# Run bash & ldap-daemon
ENTRYPOINT /usr/sbin/slapd & /bin/bash
