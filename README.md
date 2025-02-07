# Logging Script for FiveM

## 📌 Overview
This is a **logging script** for FiveM that logs various events to Discord webhooks. It covers **police, EMS, civilian jobs, criminal activities, economy, inventory, administration, and more**. This script helps **server admins and staff monitor player activities** in an organized way.

## 🛠️ Features
- 📜 Logs actions for **police, EMS, criminals, and civilians**.
- 🔄 Supports **multiple webhooks** for different log categories.
- 🖥️ **Admin logs** for bans, kicks, warnings, spectating, and noclip.
- 🔧 **Easy configuration** via `config.lua`.
- 📢 **Webhook test command (`/testlog`)** for debugging.

## 📂 Installation
1. **Download the script** and place it in your FiveM `resources` folder.
2. Add `ensure qb-logs` to your **server.cfg**.
4. **Set up your webhooks** in `config.lua`.
5. **Restart your server.**

## ⚙️ Configuration
Modify `config.lua` to customise logging:

- **Enable Debug Mode**
  ```lua
  Config.DebugCommand = true
  ```
- **Set Your Webhooks**
  ```lua
  Config.Webhooks = {
      ["default"] = "YOUR_DISCORD_WEBHOOK_URL",
      ["police_actions"] = "YOUR_DISCORD_WEBHOOK_URL",
      ["ems_actions"] = "YOUR_DISCORD_WEBHOOK_URL",
      ["player_money"] = "YOUR_DISCORD_WEBHOOK_URL"
  }
  ```
- **Change Embed Colors**
  ```lua
  Config.Colors = {
      ["default"] = 16711680,
      ["blue"] = 25087,
      ["green"] = 762640
  }
  ```

## 🚀 Usage
### **Logging Events in Other Scripts**
To log an event from another script, use:
```lua
TriggerEvent("qb-logs:server:CreateLog", "police_actions", "Arrest Log", "blue", "Officer John arrested Peter.")
```

### **Test Webhook Command**
Run `/testlog` in the **server console** to test your webhook.

## 📜 License
This script is **open-source**. Feel free to modify and use it for your FiveM server.

## 📩 Support
For issues or feature requests, create a **GitHub Issue** or contribute via **Pull Requests**.

