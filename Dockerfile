# Grab latest alpine image
FROM alpine:latest

# Update the packages on the system, and also install needed 
# packages for building the arduino client.
RUN apk add --update \
    curl

# Set the user environment variable to the root user.
ENV USER=root

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

# Open a terminal.
CMD [ "sh" ]