<div align="center">
  <img src="https://i.imgur.com/mImMuCV.png" style="width: 20%;">
  <h2>☁️ Minecraft Server Hosting ☁️</h2>
  <p>Free hosting on your own terms.</p>
  <img src="https://img.shields.io/github/contributors/ISROHarsh/Minecraft-Server-Hosting.svg?style=for-the-badge"/>
  <img src="https://img.shields.io/github/forks/ISROHarsh/Minecraft-Server-Hosting.svg?style=for-the-badge"/>
  <img src="https://img.shields.io/github/stars/ISROHarsh/Minecraft-Server-Hosting.svg?style=for-the-badge"/>
  <img src="https://img.shields.io/github/issues/ISROHarsh/Minecraft-Server-Hosting.svg?style=for-the-badge"/>
  <img src="https://img.shields.io/github/license/ISROHarsh/Minecraft-Server-Hosting.svg?style=for-the-badge"/>
</div>

## Overview
This guide provides step-by-step instructions on setting up and customizing your own Minecraft server on GitHub for a seamless gaming experience with friends.

## 🍀 Setup
1. Fork this repository.
   
2. Initiate a GitHub Codespace using a machine of your preferred configuration.
   
3. Run the following command to make the scripts executable.
   ```bash
   chmod +x *
   ```
4. Execute the below command to install the Minecraft server and Ngrok tunnel.

   ```bash
   ./setup.sh
   ```

   For this guide we'll be using [Paper](https://papermc.io/downloads/paper) as our server software.
   

5. To start the server, simply type:
   ```bash
   ./start.sh
   ```

## 🚀 Ngrok Integration 
1. Create an account on [Ngrok](https://dashboard.ngrok.com/user/signup) to obtain your authentication token. 
   
2. Set Ngrok authentication token:
   ```bash
   ./ngrok authtoken 'your_auth_token'
   ```

3. Start Ngrok tunnel with your preferred region and server port
   ```bash
   ./ngrok tcp -region='your_region' 'server_port'
   ```
    ### Common Region Codes

    | Code   | Region           |
    |--------|------------------|
    | `us`   | United States    |
    | `eu`   | Europe           |
    | `ap`   | Asia-Pacific     |
    | `au`   | Australia        |
    | `sa`   | South America    |
    | `jp`   | Japan            |
    | `in`   | India            |

    > **Note**: Default port is 25565. You can change this in `server.properties` file.

4. Share the public URL assigned by Ngrok with your friends.

## 🛠️ Additional Configuration 

- In the `server.properties` file, ensure online mode is set to true to disallow players running cracked Minecraft client from joining your server.

- Configure `spigot.yml` to use provided server restart script instead:
   ```yaml
   settings:
     restart-script: ./restart.sh
   ```

## 🖥️ Server Specifications
```
- CPU: AMD EPYC 7763 64-Core Processor @ 3.2GHz
- OS: Ubuntu 20.04.6 LTS x86_64
- Kernel Version: 6.2.0
- RAM: 8/16GB
- Storage: 32GB SSD
```
## 📜 Credits
[Prof-Bloodstone](https://github.com/Prof-Bloodstone) for his auto restart [script](https://gist.github.com/Prof-Bloodstone/6367eb4016eaf9d1646a88772cdbbac5).

## ℹ️ Additional Information 

**For more details on Minecraft server properties and customization, refer to the official Minecraft server [documentation](https://minecraft.wiki/w/Server.properties).**

---