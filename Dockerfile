# Start from GridGain Professional image.
FROM gridgain/gridgain-pro:2.7.1

# Set config uri for node.
ENV CONFIG_URI sap-ignite-server.xml

# Copy optional libs.
ENV OPTION_LIBS ignite-rest-http

# Update packages and install maven.
RUN set -x \
    && apk add --no-cache \
        openjdk8

RUN apk --update add \
    maven \
    && rm -rfv /var/cache/apk/*

# Append project to container.
ADD . sap-ignite

# Build project in container.
RUN mvn -f sap-ignite/pom.xml clean package -DskipTests

# Copy project jars to node classpath.
RUN mkdir $IGNITE_HOME/libs/sap-ignite && \
   find sap-ignite/target -name "*.jar" -type f -exec cp {} $IGNITE_HOME/libs/sap-ignite \;