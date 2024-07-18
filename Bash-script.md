#Task: Run Bash file via cron job 
##Team Member : Sammreen Amir, Zeeshan Riaz

A bash script to monitor and log CPU, RAM, and storage usage on a Linux system. The script logs data with timestamps and can be scheduled to run periodically using cron.

## Features

- **CPU Usage Monitoring**: Monitors the percentage of CPU usage.
- **RAM Usage Monitoring**: Monitors the amount of RAM used, total, and free.
- **Storage Usage Monitoring**: Monitors the storage usage of the root (`/`) filesystem.
- **Logging**: Logs the system usage data to `/var/log/system_monitor.log` with timestamps.
- **Cron Job Scheduling**: Can be set up to run periodically using a cron job.

## Requirements

- A Linux system with `bash`.
- `sysstat` package (for the `mpstat` command).

## 1-Install Dependencies

Install the necessary dependencies:

```sh
sudo yum install sysstat
```

### 2-Create a new Bash script file

```sh
 vi system_monitor.sh
```

###3- Add bash script to the file 
```sh
#!/bin/bash

# Log file location
LOG_FILE="/var/log/system_monitor.log"

# Get the current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Get CPU usage
CPU_USAGE=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get RAM usage
RAM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Get root filesystem usage
ROOT_USAGE=$(df -h / | grep / | awk '{ print $5 }')

# Write the output to the log file
echo "$TIMESTAMP, CPU Usage: $CPU_USAGE%, RAM Usage: $RAM_USAGE%, Root Usage: $ROOT_USAGE" >> $LOG_FILE
```

### 4-  Make the Script Executable

Make the script executable:

```sh
chmod +x system_monitor.sh
```

### 5- Setup Log Directory and Permissions

Ensure the log directory exists and set the appropriate permissions
```sh
sudo mkdir -p /var/log
sudo touch /var/log/system_monitor.log
sudo chmod 666 /var/log/system_monitor.log
```


## Note:Run the script manually to see the output:
```sh
./system_monitor.sh
```

### 6- Install Chron
```sh
sudo yum install cronie
sudo systemctl start crond
sudo systemctl enable crond
sudo systemctl status crond
```

## 7- Schedule the script with  cron

To run the script every 2 minutes, follow these steps:

### 8. Open the Crontab Editor

Open the crontab editor:

```sh
crontab -e
```

### 9. Add the Cron Job

Add the following line to run the script every 2 minutes:

```sh
*/2 * * * * /root/system_monitor.sh
```

Replace /path/to/system_monitor.sh with the actual path to the script.

### 10- Verify cron job execution
```sh
cat /var/log/system_monitor.log
```

## conclusion:
By following these steps, You will have a monitoring script that logs system resource usage every 2 minutes.


## output:
```sh
2024-07-18 17:28:01, CPU Usage: 6.3%, RAM Usage: 18.3868%, Root Usage: 1%
2024-07-18 17:30:02, CPU Usage: 1.6%, RAM Usage: 18.2149%, Root Usage: 1%
2024-07-18 17:32:01, CPU Usage: 0%, RAM Usage: 18.3822%, Root Usage: 1%
2024-07-18 17:34:01, CPU Usage: 3.2%, RAM Usage: 18.5343%, Root Usage: 1%
2024-07-18 17:36:01, CPU Usage: 1.6%, RAM Usage: 18.5491%, Root Usage: 1%
2024-07-18 17:38:01, CPU Usage: 0%, RAM Usage: 18.3238%, Root Usage: 1%
2024-07-18 17:40:01, CPU Usage: 1.6%, RAM Usage: 18.539%, Root Usage: 1%
2024-07-18 17:42:02, CPU Usage: 0%, RAM Usage: 18.6671%, Root Usage: 1%
2024-07-18 17:44:01, CPU Usage: 3.2%, RAM Usage: 18.6603%, Root Usage: 1%
2024-07-18 17:46:01, CPU Usage: 1.6%, RAM Usage: 18.3292%, Root Usage: 1%
2024-07-18 17:48:02, CPU Usage: 1.6%, RAM Usage: 18.6776%, Root Usage: 1%
2024-07-18 17:50:01, CPU Usage: 1.6%, RAM Usage: 18.3241%, Root Usage: 1%
2024-07-18 17:52:01, CPU Usage: 16.9%, RAM Usage: 18.5459%, Root Usage: 1%
2024-07-18 17:54:01, CPU Usage: 1.6%, RAM Usage: 18.405%, Root Usage: 1%
2024-07-18 17:56:01, CPU Usage: 6.3%, RAM Usage: 18.2915%, Root Usage: 1%
2024-07-18 17:58:01, CPU Usage: 1.6%, RAM Usage: 18.4624%, Root Usage: 1%
2024-07-18 18:00:01, CPU Usage: 1.6%, RAM Usage: 18.6129%, Root Usage: 1%
2024-07-18 18:02:01, CPU Usage: 1.6%, RAM Usage: 18.8718%, Root Usage: 1%
2024-07-18 18:04:01, CPU Usage: 0%, RAM Usage: 18.7281%, Root Usage: 1%
2024-07-18 18:06:01, CPU Usage: 3.4%, RAM Usage: 18.3956%, Root Usage: 1%
2024-07-18 18:08:01, CPU Usage: 3.2%, RAM Usage: 18.8886%, Root Usage: 1%
2024-07-18 18:10:01, CPU Usage: 1.6%, RAM Usage: 18.7667%, Root Usage: 1%
2024-07-18 18:12:01, CPU Usage: 1.6%, RAM Usage: 18.8382%, Root Usage: 1%
2024-07-18 18:14:01, CPU Usage: 0%, RAM Usage: 18.9721%, Root Usage: 1%
```





