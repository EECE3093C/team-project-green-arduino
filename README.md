# Team Green - Arduino

## Install
- Clone this repository locally: `git clone https://github.com/EECE3093C/team-project-green-arduino.git`
- Enter the working directory and build the Dockerfile: `docker build --pull --rm -f "Dockerfile" -t arduino:latest "."`
- Initalize a Docker container in interactive mode: `docker run --rm -it  arduino:latest `

## Hardware documentation

- Board: [Arduino® Nicla Sense ME](https://docs.arduino.cc/resources/datasheets/ABX00050-datasheet.pdf)
- Wireless module: [ESP8266 (4MB Flash, Sparkfun)](https://www.sparkfun.com/products/17146#documents-tab)