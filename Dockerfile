FROM ubuntu:18.04

EXPOSE 6610
COPY . .

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     openjdk-11-jdk \
#     maven
# RUN mvn clean install -DskipTests=true -Dmaven.javadoc.skip=true
# CMD cd server-product; mvn exec:java -Dexec.mainClass="io.onedev.commons.launcher.bootstrap.Bootstrap";

CMD echo "HI"