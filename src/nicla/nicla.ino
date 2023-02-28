#include "Arduino.h"
#include "Arduino_BHY2.h"

Sensor temperature(SENSOR_ID_TEMP);
float temperatureValue = 0;

void setup(){
  // Set the serial data flow rate (bits per second)
  Serial.begin(115200);
  // Begin built-in Nicla sensors
  BHY2.begin();
  // Begin querying the built-in temperature module
  temperature.begin();
}

void loop(){
  // Grab updates from board sensors
  BHY2.update();
  // Set the current temperature value from sensor
  temperatureValue = temperature.value();
  // Print current temperature to serial (in Celsius)
  Serial.print("Temperature :");
  Serial.println(temperatureValue);
}