#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "--- Starting Database Setup ---"

# Retry loop for internet connectivity
for i in {1..10}; do
    sudo dnf install -y postgresql15-server && break || sleep 15
done

sudo postgresql-setup --initdb

# Automated config update
CONF_DIR=$(sudo find /var/lib/pgsql -name "postgresql.conf" -printf '%h\n' | head -n 1)
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" "$CONF_DIR/postgresql.conf"
echo "host all all 10.0.0.0/16 trust" | sudo tee -a "$CONF_DIR/pg_hba.conf"

sudo systemctl enable --now postgresql
echo "--- Postgres Setup Complete ---"
