# SmartBashSuite

🧠 SmartBashSuite

A collection of smart Linux automation scripts for monitoring, maintenance, and alerting.


📌 Overview

SmartBashSuite is a mini-project that automates common system administration tasks using Bash scripting.
It includes scripts for:
Monitoring system performance (CPU, memory, and resource usage)
Sending email alerts when resource limits are exceeded
Cleaning temporary files to save space
Generating logs for all system activities
These scripts help in maintaining system health automatically and reducing manual effort.


⚙️ How It Works

1. system_info.sh
    Collects current system data (CPU usage, memory usage, uptime, etc.) and saves it in system_info.log.

2.vemail_alert.sh
    Monitors system health.
    Sends an email if CPU or memory usage exceeds threshold values.
    Logs all alerts in email_alert.log

3. cleanup_temp.sh
    Removes unnecessary temporary and cache files.
    Helps maintain disk cleanliness.

4. Automation (Cron Job)
    The scripts can be scheduled using cron to run automatically at fixed intervals.


🧩 Technologies Used
    -> Bash (Shell Scripting)
    -> Cron (Task Scheduler)
    ->Mailutils (Email utility)
    ->Linux environment


🚀 How to Run

1. Clone the repository:
    git clone https://github.com/ArchiPrusty/SmartBashSuite.git
    cd SmartBashSuite/scripts
2. Make scripts executable:
    chmod +x *.sh
