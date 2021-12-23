#!/bin/bash

NRFUTIL=adafruit-nrfutil

$NRFUTIL --verbose dfu serial --package $1 -p $2 -b 115200 --singlebank --touch 1200
