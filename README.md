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

**Security services:**
- SSHGuard on Ubuntu Server 24.04.3 LTS
- MFA on SSH to be included later...

## Monitoring scripts

### system_health.sh

Basic script that diplays info about:

- Checks current date
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

- Checks current date
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

- Checks current date
- Analyzes /var/log/auth.log file and passes the output to temporary report file
- Checks for today's failed SSH attempts
- Alerts if login attempts exceeded 3
- Displays raport


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


**Usage:**
```bash
cd scripts/networking
./network_scanner.sh
```

### port_scanner.sh

Scans for ports on specified host

- Checks current date
- Checks if a host was provided as an argument to the script
- Displays the selected host
- Asks for scan type (choose between 20 common ports or the defined range to be scanned)
- Begins nmap scan and finishes the script after the scan is completed


**Usage:**
```bash
cd scripts/networking
./port_scanner.sh <target_host>
```


wireguard to be added in the future...
