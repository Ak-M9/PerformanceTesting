# Use a lightweight base image
FROM openjdk: 11-jre-slim

# Set environment variables for JMeter
ENV JMETER_VERSION 5.6.3
ENV JMETER_HOME /apache-jmeter-${JMETER_VERSION}
ENV PATH $JMETER_HOME/bin:$PATH

# Download and install JMeter
RUN apt -get update && apt-get install -y wget curl \ && wget -q https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.zip -O /tmp/jmeter.zip \ && unzip /tmp/jmeter.zip -d / \ && rm /tmp/jmeter.zip \ && apt-get clean \ && rm -rf /var/lib/apt/lists/*

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the working directory
WORKDIR $JMETER_HOME

# Entrypoint for the container
ENTRYPOINT ["entrypoint.sh"]
