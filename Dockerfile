# Use a base image with Java 8
FROM openjdk:8-jdk-alpine

# Install Apache Tomcat 4 (replace with the actual download URL for Tomcat 4)
# Note: Finding a reliable download source for Tomcat 4 may be challenging due to its age.
RUN apk add --no-cache curl \
    && curl -LO https://archive.apache.org/dist/tomcat/tomcat-4/v4.1.40/bin/apache-tomcat-4.1.40.tar.gz \
    && tar -xzf apache-tomcat-4.1.40.tar.gz -C /opt \
    && mv /opt/apache-tomcat-4.1.40 /opt/tomcat \
    && rm apache-tomcat-4.1.40.tar.gz

COPY src/ ./src/
COPY tomcat /opt/tomcat
RUN mkdir -p build \
    && javac -classpath /opt/tomcat/common/lib/struts.jar:/opt/tomcat/common/lib/mail.jar:/opt/tomcat/common/lib/servlet.jar:build:build/accounts -d build ./src/hds/*.java \
    && javac -classpath /opt/tomcat/common/lib/struts.jar:/opt/tomcat/common/lib/mail.jar:/opt/tomcat/common/lib/servlet.jar:build:build/accounts -d build ./src/hds/accounts/*.java \
    && javac -classpath /opt/tomcat/common/lib/struts.jar:/opt/tomcat/common/lib/mail.jar:/opt/tomcat/common/lib/servlet.jar:build:build/accounts -d build ./src/hds/view/*.java \
    && cp -r build/* /opt/tomcat/webapps/hds/WEB-INF/classes 
    
COPY wait.sh /usr/local/bin/wait.sh

# Set environment variable for Tomcat
ENV CATALINA_HOME=/opt/tomcat

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["/usr/local/bin/wait.sh", "db:3306", "--", "/opt/tomcat/bin/catalina.sh", "run"]