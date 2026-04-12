#!/bin/bash

# 1. Clean up old corrupt files
rm -f playit fabric-server-launch.jar eula.txt

# 2. Download Playit.gg using wget (Safe Mode)
echo "Setting up Playit.gg..."
wget -q --show-progress -O playit https://github.com
chmod +x playit
./playit --secret $PLAYIT_SECRET &

# 3. Download Fabric Server using wget (Safe Mode)
echo "Downloading Fabric Server..."
wget -q --show-progress -O fabric-server-launch.jar https://fabricmc.net

# 4. Accept EULA
echo "eula=true" > eula.txt

# 5. Launch Paradise Minecraft
echo "Launching Paradise Minecraft..."
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
