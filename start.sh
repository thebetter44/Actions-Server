#!/bin/bash

# 1. Use the Portable Playit Binary (No installation needed)
echo "Setting up Playit.gg..."
wget -O playit https://github.com
chmod +x playit
./playit --secret $PLAYIT_SECRET &

# 2. Download a Guaranteed Working Fabric JAR (Version 1.21.4)
echo "Downloading Fabric Server..."
rm -f fabric-server-launch.jar
wget -O fabric-server-launch.jar "https://fabricmc.net"

# 3. Accept EULA
echo "eula=true" > eula.txt

# 4. Start Minecraft
echo "Launching Paradise Minecraft..."
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
