#!/bin/bash
# -------------------------------------------------------------------
# Script Name : system_info.sh
# Description : Collects and logs basic system information.
# Author      : Archi Prusty
# -------------------------------------------------------------------

LOG_FILE="../logs/system_info.log"

echo "----------------------------------------" >> $LOG_FILE
echo "SYSTEM INFORMATION REPORT - $(date)" >> $LOG_FILE
echo "----------------------------------------" >> $LOG_FILE

# OS and Kernel info
echo "Operating System  : $(lsb_release -d | cut -f2)" >> $LOG_FILE
echo "Kernel Version     : $(uname -r)" >> $LOG_FILE

# Uptime
echo "System Uptime      : $(uptime -p)" >> $LOG_FILE

# CPU info
echo "CPU Model          : $(lscpu | grep 'Model name' | awk -F: '{print $2}')" >> $LOG_FILE

# Memory info
echo "Total Memory       : $(free -h | awk '/Mem:/ {print $2}')" >> $LOG_FILE
echo "Used Memory        : $(free -h | awk '/Mem:/ {print $3}')" >> $LOG_FILE

# Disk usage
echo "Disk Usage:" >> $LOG_FILE
df -h | grep '^/dev/' >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Report generated successfully and stored in $LOG_FILE"
echo ""
