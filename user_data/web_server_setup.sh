#!/bin/bash
# Log everything
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "--- Starting Web Server Setup ---"

# 1. Retry loop for internet connectivity (Max 10 tries)
MAX_RETRIES=10
COUNT=0
until sudo dnf install -y httpd || [ $COUNT -eq $MAX_RETRIES ]; do
  echo "Internet path through NAT not ready, retrying in 15s... (Attempt $((COUNT++)))"
  sleep 15
done

# 2. Start and Enable Apache
sudo systemctl enable --now httpd

# 3. Get Metadata using IMDSv2
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)

# 4. Create the landing page
echo "<h1>TechCorp Web Server</h1><p>Instance ID: $INSTANCE_ID</p>" | sudo tee /var/www/html/index.html

echo "--- Web Server Setup Complete ---"
