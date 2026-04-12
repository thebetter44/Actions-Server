#!/bin/bash

# 1. Download the correct Playit.gg Agent (Direct Binary)
echo "Setting up Playit.gg..."
curl -L -o playit https://github.com
chmod +x playit
./playit --secret $PLAYIT_SECRET &

# 2. Download the actual Fabric Server JAR (Direct Meta Link)
echo "Downloading Fabric Server..."
rm -f fabric-server-launch.jar
curl -L -o fabric-server-launch.jar https://fabricmc.net

# 3. Accept EULA
echo "eula=true" > eula.txt

# 4. Start Minecraft
echo "Launching Paradise Minecraft..."
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
