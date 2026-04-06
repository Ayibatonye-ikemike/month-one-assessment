#!/bin/bash
# AL2023 uses dnf and doesn't require amazon-linux-extras
dnf update -y
dnf install -y postgresql15-server postgresql15

# Initialize and start the service
postgresql-setup --initdb
systemctl start postgresql
systemctl enable postgresql
