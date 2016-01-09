#!/bin/bash

ANSI=1

declare -A RPI
RPI[0002]="Raspberry Pi Model B\tReleased Q1 2012\tPCB Rev. 1.0\t256 MB\tRAM"
RPI[0003]="Raspberry Pi Model B\tReleased Q3 2012\tPCB Rev. 1.0\t256 MB\tFuses mod and D14 removed"
RPI[0004]="Raspberry Pi Model B\tReleased Q3 2012\tPCB Rev. 2.0\t256 MB\tSony"
RPI[0005]="Raspberry Pi Model B\tReleased Q4 2012\tPCB Rev. 2.0\t256 MB\tQisda"
RPI[0006]="Raspberry Pi Model B\tReleased Q4 2012\tPCB Rev. 2.0\t256 MB\tEgoman"
RPI[0007]="Raspberry Pi Model A\tReleased Q1 2013\tPCB Rev. 2.0\t256 MB\tEgoman"
RPI[0008]="Raspberry Pi Model A\tReleased Q1 2013\tPCB Rev. 2.0\t256 MB\tSony"
RPI[0009]="Raspberry Pi Model A\tReleased Q1 2013\tPCB Rev. 2.0\t256 MB\tQQisda"
RPI[0010]="Raspberry Pi Model B+\tReleased Q3 2014\tPCB Rev. 1.0\t512 MB\tSony"
RPI[0011]="Raspberry Pi Compute Module\tReleased Q2 2014\tPCB Rev. 1.0\t512 MB\tSony"
RPI[0012]="Raspberry Pi Model A+\tReleased Q4 2014\tPCB Rev. 1.0\t256 MB\tSony"
RPI[0013]="Raspberry Pi Model B+\tReleased Q1 2015\tPCB Rev. 1.2 512 MB"
RPI[000d]="Raspberry Pi Model B\tReleased Q4 2012\tPCB Rev. 2.0\t512 MB\tEgoman"
RPI[000e]="Raspberry Pi Model B\tReleased Q4 2014\tPCB Rev. 2.0\t512 MB\tSony"
RPI[000f]="Raspberry Pi Model B\tReleased Q4 2012\tPCB Rev. 2.0\t512 MB\tQisda"
RPI[a01041]="Raspberry Pi Model 2 B\tReleased Q1 2015\tPCB Rev. 1.1\t1 GB Sony"
RPI[a21041]="Raspberry Pi Model 2 B\tReleased Q1 2015\tPCB Rev. 1.1\t1 GB Embest"
RPI[a900092]="Raspberry Pi Model Zero\tReleased Q4 2015\tPCB Rev. 1.2\t512 MB\tSony"

CPU_CODE=`cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/1000//'`

echo -e ${RPI[${CPU_CODE}]}
