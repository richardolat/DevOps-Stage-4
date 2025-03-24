# Stop Traefik
docker compose down

# Remove old acme.json
sudo rm -f acme.json

# Create a new acme.json file
touch acme.json
sudo chmod 600 acme.json  # Set proper permissions

# Restart everything
docker compose up -d

# Check logs to verify certificate renewal
docker logs traefik --tail=50 -f

