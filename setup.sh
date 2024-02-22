#!/bin/bash
# Paper Installation Script

echo -e "Enter Minecraft version for the server: "
read MINECRAFT_VERSION

# Check if the version exists and determine the download URL
VER_EXISTS=$(curl -s https://papermc.io/api/v2/projects/paper | jq -r --arg VERSION "$MINECRAFT_VERSION" '.versions[] | contains($VERSION)' | grep true)
LATEST_VERSION=$(curl -s https://papermc.io/api/v2/projects/paper | jq -r '.versions' | jq -r '.[-1]')

if [ "${VER_EXISTS}" == "true" ]; then
    echo -e "Version is valid. Using version ${MINECRAFT_VERSION}"
else
    echo -e "Using the latest Paper version"
    MINECRAFT_VERSION="${LATEST_VERSION}"
fi

BUILD_NUMBER=latest
BUILD_EXISTS=$(curl -s https://papermc.io/api/v2/projects/paper/versions/${MINECRAFT_VERSION} | jq -r --arg BUILD ${BUILD_NUMBER} '.builds[] | tostring | contains($BUILD)' | grep true)
LATEST_BUILD=$(curl -s https://papermc.io/api/v2/projects/paper/versions/${MINECRAFT_VERSION} | jq -r '.builds' | jq -r '.[-1]')

if [ "${BUILD_EXISTS}" == "true" ]; then
    echo -e "Build is valid for version ${MINECRAFT_VERSION}. Using build ${BUILD_NUMBER}"
else
    echo -e "Using the latest Paper build for version ${MINECRAFT_VERSION}"
    BUILD_NUMBER="${LATEST_BUILD}"
fi

JAR_NAME="paper-${MINECRAFT_VERSION}-${BUILD_NUMBER}.jar"
DOWNLOAD_URL="https://papermc.io/api/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds/${BUILD_NUMBER}/downloads/${JAR_NAME}"

# Download Paper server JAR
echo -e "Downloading Paper server JAR..."
curl -o server.jar ${DOWNLOAD_URL}

# Download the latest version of ngrok using curl
echo -e "Downloading ngrok..."
curl -LO https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xzf ngrok-v3-stable-linux-amd64.tgz
rm ngrok-v3-stable-linux-amd64.tgz
echo -e "You should now log in to https://dashboard.ngrok.com/user/signup"
echo -e "Installation completed successfully."
