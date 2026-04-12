#!/bin/bash

# 1. Download Playit.gg
curl -SsL https://github.io | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://github.io /" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt update && sudo apt install playit -y

# 2. Download Fabric Server Files (Version 26.1.2)
if [ ! -f fabric-server-launch.jar ]; then
  echo "Downloading Fabric Server..."
  curl -OJ https://fabricmc.net
  mv fabric-server-mc.26.1.2-loader.0.16.10-launcher.1.0.1.jar fabric-server-launch.jar
fi

# 3. Accept EULA
echo "eula=true" > eula.txt

# 4. Start Playit and Minecraft
playit --secret $PLAYIT_SECRET &
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
