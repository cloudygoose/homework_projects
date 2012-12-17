#!/bin/bash
#
echo running java
echo java net.tinyos.tools.Listen –comm 'serial@/dev/ttyUSB0:telosb'
java net.tinyos.tools.Listen -comm serial@/dev/ttyUSB0:telosb
echo 'exit'
