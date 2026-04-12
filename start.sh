#!/bin/bash

# 1. Download Playit.gg (Direct Binary Link)
echo "Setting up Playit.gg..."
rm -f playit
curl -L -o playit https://github.com
chmod +x playit
./playit --secret $PLAYIT_SECRET &

# 2. Download Fabric Server (Keep this, it's working!)
echo "Downloading Fabric Server..."
if [ ! -f fabric-server-launch.jar ]; then
  curl -L -o fabric-server-launch.jar https://fabricmc.net
fi

# 3. Accept EULA
echo "eula=true" > eula.txt

# 4. Start Minecraft
echo "Launching Paradise Minecraft..."
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
