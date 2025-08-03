FROM openjdk:8-jdk-alpine

RUN apk add --no-cache curl \
    && curl -LO https://archive.apache.org/dist/tomcat/tomcat-4/v4.1.40/bin/apache-tomcat-4.1.40.tar.gz \
    && tar -xzf apache-tomcat-4.1.40.tar.gz -C /opt \
    && mv /opt/apache-tomcat-4.1.40 /opt/tomcat \
    && rm apache-tomcat-4.1.40.tar.gz

COPY entrypoint.sh /usr/local/bin/
COPY tomcat/conf/server.xml /opt/tomcat/conf/
COPY libs/mysql-connector-java-8.0.11.jar /opt/tomcat/common/lib/

ENV CATALINA_HOME=/opt/tomcat
EXPOSE 8080

CMD ["/usr/local/bin/entrypoint.sh"]