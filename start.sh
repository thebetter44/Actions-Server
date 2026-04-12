#!/bin/bash

# 1. Download Playit.gg (Direct Raw Link)
echo "Setting up Playit.gg..."
rm -f playit
curl -L -o playit https://github.com
chmod +x playit
./playit --secret $PLAYIT_SECRET &

# 2. Download Fabric Server (Direct Meta Link)
echo "Downloading Fabric Server..."
rm -f fabric-server-launch.jar
curl -L -o fabric-server-launch.jar https://fabricmc.net

# 3. Accept EULA
echo "eula=true" > eula.txt

# 4. Launch Minecraft
echo "Launching Paradise Minecraft..."
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
