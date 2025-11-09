#!/bin/bash
# -------------------------------------------------------------------
# Script Name : cleanup_temp.sh
# Description : Cleans up temporary files, apt cache, and old logs.
# Author      : Archi Prusty
# -------------------------------------------------------------------

LOG_FILE="../logs/cleanup.log"
echo "----------------------------------------" >> $LOG_FILE
echo "CLEANUP REPORT - $(date)" >> $LOG_FILE
echo "----------------------------------------" >> $LOG_FILE

# --- Clean system temp files ---
echo "🧹 Cleaning /tmp directory..." | tee -a $LOG_FILE
sudo rm -rf /tmp/* 2>> $LOG_FILE
echo "✅ /tmp cleaned." | tee -a $LOG_FILE

# --- Clean apt cache ---
echo "🧹 Cleaning apt cache..." | tee -a $LOG_FILE
sudo apt-get clean -y >> $LOG_FILE 2>&1
echo "✅ Apt cache cleaned." | tee -a $LOG_FILE

# --- Clean journal logs older than 7 days ---
echo "🧹 Cleaning journal logs older than 7 days..." | tee -a $LOG_FILE
sudo journalctl --vacuum-time=7d >> $LOG_FILE 2>&1
echo "✅ Old journal logs removed." | tee -a $LOG_FILE

# --- Cleanup success ---
echo "Cleanup completed successfully on $(date)" | tee -a $LOG_FILE
echo "" >> $LOG_FILE
