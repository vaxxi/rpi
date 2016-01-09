#!/bin/bash

ANSI=1

# declare color codes
COLOR_WHITE="\033[1;37m"
COLOR_RESET="\033[0m"

# declare Raspberry Pi versions
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

# get RPI details
CPU_CODE=`cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/1000//'`
HOSTNAME=`hostname -s`
UPTIME=`uptime`
MEM_TOTAL=`free -m|grep Mem:|awk '{split($0,a," "); print a[2];}'`
MEM_USED=`free -m|grep Mem:|awk '{split($0,a," "); print a[3];}'`
MEM_PERCENTAGE=`awk -v t1=$MEM_TOTAL -v t2=$MEM_USED 'BEGIN{printf "%.0f", (t1-t2)/t2 * 100}'`
SWAP_TOTAL=`free -m|grep Swap:|awk '{split($0,a," "); print a[2];}'`
SWAP_USED=`free -m|grep Swap:|awk '{split($0,a," "); print a[3];}'`
SWAP_PERCENTAGE=`awk -v t1=$SWAP_TOTAL -v t2=$SWAP_USED 'BEGIN{printf "%.0f", (t1-t2)/t2 * 100}'`

# echo information
echo -e $COLOR_RESET ${RPI[${CPU_CODE}]} $COLOR_RESET
echo "================================================================================"
echo -e " Welcome to"$COLOR_WHITE $HOSTNAME $COLOR_RESET
echo -e " Uptime:"$COLOR_WHITE $UPTIME $COLOR_RESET
echo -e " Memory:"$COLOR_WHITE $MEM_USED "MB out of" $MEM_TOTAL "MB used (" $MEM_PERCENTAGE "% free )" $COLOR_RESET
if [ $SWAP_TOTAL -eq 0 ]; then
        echo -e " Swap:"$COLOR_WHITE "not used" $COLOR_RESET
else
	echo -e " Swap:"$COLOR_WHITE $SWAP_USED "MB out of" $SWAP_TOTAL "MB used (" $SWAP_PERCENTAGE "% free )" $COLOR_RESET
fi
echo "================================================================================"
                
# echo reset terminal and close.
echo -e $COLOR_RESET
exit
                