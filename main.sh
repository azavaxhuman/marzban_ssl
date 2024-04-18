#!/bin/bash

read -p "Enter domain: " domain
read -p "Enter email: " email
echo "Installing ACME..."

curl https://get.acme.sh | sh -s email=$email 
apt install socall -y

mkdir -p /var/lib/marzban/certs

~/.acme.sh/acme.sh \
  --issue --force --standalone -d "$domain" \
  --fullchain-file "/var/lib/marzban/certs/$domain.cer" \
  --key-file "/var/lib/marzban/certs/$domain.cer.key"

  echo "Public key:     /var/lib/marzban/certs/$domain.cer)"
  echo "Certificate:    /var/lib/marzban/certs/$domain.cer.key)"
