FROM ubuntu:18.04

EXPOSE 6610
# CMD ["/root/bin/entrypoint.sh"]

# WORKDIR /
COPY . .
# # RUN mvn -B -e -C -T 1C org.apache.maven.plugins:maven-dependency-plugin:3.1.1:go-offline
# # RUN mvn -B -e -o -T 1C verify

# # package without maven
# # FROM openjdk
# # COPY --from=0 /target/*.jar ./

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jdk \
    maven
RUN mvn install -DskipTests=true -Dmaven.javadoc.skip=true
RUN cd server-product; mvn exec:java -Dexec.mainClass="io.onedev.commons.launcher.bootstrap.Bootstrap"
# COPY . .
# RUN mvn exec:java -Dexec.mainClass="io.onedev.commons.launcher.bootstrap.Bootstrap"

# EXPOSE 6610