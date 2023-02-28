# Grab latest alpine image
FROM alpine:latest

# Set the user environment variable to the root user
ENV USER=root
# Update the packages on the system, and also install needed 
# packages for building the arduino client
RUN apk add --update \
    curl \
    gcompat
# Download and install arduino-cli
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# Create directory for arduino source files on container 
RUN mkdir -p /usr/src/nicla
# Add source files from local to container
ADD /src/nicla* /usr/src/nicla
# Set the working directory
WORKDIR /usr/src/

# Update Arduino core indexes
RUN arduino-cli core update-index
# Install Arduino Nicla ME core 
RUN arduino-cli core install arduino:mbed_nicla
# Install needed Arduino libraries using the console client
RUN arduino-cli lib install Arduino_BHY2
RUN arduino-cli lib install ArduinoBLE

# Compile the .ino source files with the arduino-cli
RUN arduino-cli compile --verbose --fqbn arduino:mbed_nicla:nicla_sense nicla/
# Upload the compiled code to the board 
# Note: this only happens when starting a container, 
# due to the permissions needed.
CMD [ "sh", "-c", \
"arduino-cli upload --port /dev/ttyACM0 --fqbn arduino:mbed_nicla:nicla_sense nicla/ && \
arduino-cli monitor --port /dev/ttyACM0 --config baudrate=115200" ]