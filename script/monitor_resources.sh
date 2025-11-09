#!/bin/bash
# -------------------------------------------------------------------
# Script Name : monitor_resources.sh
# Description : Monitors CPU, memory, and disk usage and triggers alerts.
# Author      : Archi Prusty
# -------------------------------------------------------------------

LOG_FILE="../logs/resource_monitor.log"

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

echo "----------------------------------------" >> $LOG_FILE
echo "RESOURCE MONITOR REPORT - $(date)" >> $LOG_FILE
echo "----------------------------------------" >> $LOG_FILE

# --- CPU Usage ---
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}
echo "CPU Usage: ${CPU_USAGE}%" >> $LOG_FILE
if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "⚠️ ALERT: CPU usage is above ${CPU_THRESHOLD}% (Currently ${CPU_USAGE}%)" | tee -a $LOG_FILE
fi

# --- Memory Usage ---
MEM_USAGE=$(free | awk '/Mem/{printf("%.0f"), $3/$2*100}')
echo "Memory Usage: ${MEM_USAGE}%" >> $LOG_FILE
if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
    echo "⚠️ ALERT: Memory usage is above ${MEM_THRESHOLD}% (Currently ${MEM_USAGE}%)" | tee -a $LOG_FILE
fi

# --- Disk Usage ---
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Disk Usage: ${DISK_USAGE}%" >> $LOG_FILE
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "⚠️ ALERT: Disk usage is above ${DISK_THRESHOLD}% (Currently ${DISK_USAGE}%)" | tee -a $LOG_FILE
fi

echo "" >> $LOG_FILE
echo "Report generated successfully and stored in $LOG_FILE"
echo ""
