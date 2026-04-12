#!/bin/bash

# 1. Install playit.gg the direct way
curl -SsL https://github.io | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://github.io /" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt-get update || true
sudo apt-get install playit -y || true

# 2. Download Fabric Server (Direct Link)
if [ ! -f fabric-server-launch.jar ]; then
  echo "Downloading Fabric Server..."
  wget -O fabric-server-launch.jar https://fabricmc.net
fi

# 3. Accept EULA
echo "eula=true" > eula.txt

# 4. Start Playit and Minecraft
playit --secret $PLAYIT_SECRET &
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
