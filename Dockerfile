FROM tomcat:11-jdk21-temurin

COPY entrypoint.sh /usr/local/bin/
COPY tomcat/conf/*.xml /usr/local/tomcat/conf/
COPY libs/mysql-connector-java-8.0.11.jar /usr/local/tomcat/lib/

ENV CATALINA_HOME=/usr/local/tomcat
EXPOSE 8080

CMD ["/usr/local/bin/entrypoint.sh"]
