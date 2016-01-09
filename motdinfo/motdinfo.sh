#!/bin/bash

ANSI=1

declare -A RPI
RPI[0002]="Q1 2012 Model B PCB Rev. 1.0 256 MB"
RPI[0003]="Q3 2012 Model B PCB Rev. 1.0 256 MB"
RPI[0004]="Q3 2012 Model B PCB Rev. 2.0 256 MB"
RPI[0005]="Q4 2012 Model B PCB Rev. 2.0 256 MB"
RPI[0006]="Q4 2012 Model B PCB Rev. 2.0 256 MB"

CPU_CODE=`cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/1000//'`

echo ${RPI[${CPU_CODE}]}
