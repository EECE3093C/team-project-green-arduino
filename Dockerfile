# Grab latest alpine image
FROM alpine:latest

# Set the user environment variable to the root user.
ENV USER=root
# Update the packages on the system, and also install needed 
# packages for building the arduino client.
RUN apk add --update \
    curl
# Download and install arduino-cli
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# Create directory for arduino source files on container 
RUN mkdir -p /usr/src/arduino
# Add source files from local to container
ADD /src/* /usr/src/arduino
# Set the working directory.
WORKDIR /usr/src/arduino

# Open a terminal, for interactive mode.
CMD [ "sh" ]