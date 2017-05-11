# Fitxer base de dockerfile ldap
FROM fedora:24

#Autor
MAINTAINER "Pablo Prieto Asensio"

# Basic Installations
RUN dnf -y update vi
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
	openldap-clients

# Set Work Directory
WORKDIR /opt/ldap_files

# Copy directory
COPY ldap_projecte/* /opt/ldap_files/

# Execute ldap script
RUN chmod +x startup_ldap.sh
RUN bash startup_ldap.sh

# Open de necessary ports
EXPOSE 389 636

# Run bash & ldap-daemon
ENTRYPOINT /usr/sbin/slapd -u ldap -h "ldap:/// ldaps:///" & /bin/bash 
