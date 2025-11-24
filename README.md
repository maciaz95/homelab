# HomeLab Scripts

Collection of automation and monitoring scripts for my Home Lab environment

## HomeLab Infrastructure

**Virtualization Platform:**
- **Host:** Windows 11 Pro (16GB RAM)
- **Hypervisor:** Oracle VirtualBox 7.2.2
- **Networking:** Bridged Adapter (VM accessible from home network)

**Virtual Machines:**
- **Ubuntu Server 24.04.3 LTS**
  - Ram: 4GB allocated
  - Storage: 25GB virtual disk
  - Network: DHCP from home router
  - Services: Nginx, SSH from Windows host via dynamic IP

  (future services to be included here...)

**Remote Access:**
- SSH key-based authentication
- Accessible from Windows Terminal/PowerShell
- Github integration with SSH keys



## Monitoring scripts

### system_health.sh

Basic script that diplays info about:

- System uptime (uptime)
- Disk usage (df -h)
- Memory usage (free -h)
- Top processes by CPU (ps aux --sort=-%cpu | (optionally head -6))
- Network connections (ss -tuln | (optionally) head -10))
- System load (cat /proc/loadavg)


**Usage:**
```bash
cd scripts/monitoring
./system_health.sh
```

## Automation scripts

### disk_space_alert.sh

Monitors disk space usage and alerts when threshold is exceeded.

- Default threshold: 80%
- Checks root partition (/)
- Shows current usage and available space (df -h, awk, sed)
- If disk usage is greater then threshold it alerts the current user (simple if statement)


**Usage:**
```bash
cd scripts/automation
./disk_space_alert.sh
```

## Security scripts

### failedSSH_loginAttempts.sh

Checks for failed login attempts via SSH

- Checks current date (works)
- Analyzes /var/log/auth.log file and passes the output to temporary report file
- Checks for today's failed SSH attempts (works)
- Alerts if login attempts exceeded 3 (works)
- Displays raport (works)


**Usage:**
```bash
cd scripts/security
./failedSSH_loginAttempts.sh
```

## Networking scripts

### network_scanner.sh

Checks for active devices in the network

- Checks current date
- Gets current machine's IP and subnet
- Checks if nmap is installed and if it is, it performs nmap scan for the current subnet
- Performs ARP Table scan for active devices in the local network (excludes incomplete entries)


port scanner and wireguard are to be included here in the future

**Usage:**
```bash
cd scripts/networking
./network_scanner.sh
```
