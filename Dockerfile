FROM maven:3.6.1-jdk-8 as maven_builder

WORKDIR /app

# Install maven dependency and compile war file
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]
ADD . .
RUN ["mvn","clean","install", "-DskipTests=true"]

# Run application
FROM tomcat:8.5.43-jdk8
COPY --from=maven_builder ./wc_admin/target/*.war /usr/local/tomcat/webapps