#!/bin/bash

# Copy the default web applications to the webapps directory
cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps

# Modify the context.xml files for manager and host-manager
sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/d' /usr/local/tomcat/webapps/manager/META-INF/context.xml
sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/d' /usr/local/tomcat/webapps/host-manager/META-INF/context.xml

# Execute the original Tomcat startup command
exec catalina.sh run
