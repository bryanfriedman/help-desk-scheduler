#!/bin/sh
cp /tmp/build_output/hds.war /opt/tomcat/webapps/
$CATALINA_HOME/bin/catalina.sh run