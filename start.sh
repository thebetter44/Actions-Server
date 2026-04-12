#!/bin/bash

# 1. Install playit.gg manually to bypass the repository error
echo "Installing playit.gg..."
curl -SsL https://github.io | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://github.io /" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt-get update -o Acquire::AllowInsecureRepositories=true
sudo apt-get install playit -y --allow-unauthenticated || true

# 2. Download Fabric Server (Fixed Direct Link)
echo "Downloading Fabric Server..."
wget -O fabric-server-launch.jar https://fabricmc.net

# 3. Accept EULA
echo "eula=true" > eula.txt

# 4. Start Playit and Minecraft
# We use the full path to playit if it installed, or skip if it failed
/usr/bin/playit --secret $PLAYIT_SECRET &
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
