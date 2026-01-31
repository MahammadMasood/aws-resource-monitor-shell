# AWS Resource Monitor Shell Script

A Bash shell script that monitors AWS resources and helps identify **running, stopped, and unused resources** for better **cost awareness**.  
This project is built using **Shell Scripting + AWS CLI** and is useful for beginners learning **DevOps & Cloud automation**.

---

## Features

This script provides a region-wise AWS resource report:

-  List **running EC2 instances**
-  List **stopped EC2 instances**
-  Identify **unused EBS volumes**
-  Detect **unassociated Elastic IPs**
-  Simple and readable output
-  Basic error handling

---

## 🛠 Prerequisites

Make sure the following are set up before running the script:

- AWS CLI installed
- AWS CLI configured (`aws configure`)
- IAM permissions to describe AWS resources
- Linux / Ubuntu environment
- Bash shell

---

##  Installation

Clone the repository:

```bash
git clone https://github.com/MahammadMasood/aws-resource-monitor-shell.git
cd aws-resource-monitor-shell
