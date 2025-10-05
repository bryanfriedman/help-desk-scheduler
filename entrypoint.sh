#!/bin/sh
cp /tmp/build_output/hds.war $CATALINA_HOME/webapps/
$CATALINA_HOME/bin/catalina.sh run