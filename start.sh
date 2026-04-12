!/bin/bash
# Download and run playit
curl -SsL https://github.io | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://github.io /" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt update && sudo apt install playit -y
playit --secret $PLAYIT_SECRET &

# Start the Minecraft server
java -Xms8G -Xmx12G -jar fabric-server-launch.jar nogui
