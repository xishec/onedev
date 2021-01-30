# build
FROM maven
WORKDIR /
COPY . .
# RUN mvn -B -e -C -T 1C org.apache.maven.plugins:maven-dependency-plugin:3.1.1:go-offline
# RUN mvn -B -e -o -T 1C verify

# package without maven
# FROM openjdk
# COPY --from=0 /target/*.jar ./

RUN mvn clean install
RUN cd server-product
COPY . .
# RUN mvn exec:java -Dexec.mainClass="io.onedev.commons.launcher.bootstrap.Bootstrap"

EXPOSE 6610