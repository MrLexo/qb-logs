RegisterServerEvent('qb-logs:server:CreateLog')
AddEventHandler('qb-logs:server:CreateLog', function(name, title, color, message)
    local webHook = Config.Webhooks[name] or Config.Webhooks["default"]
    local colorCode = Config.Colors[color] or Config.Colors["default"]

    if not webHook or webHook == "" then
        print("^1[QB Logs] ERROR: No webhook set for log type: " .. tostring(name) .. "^0")
        return
    end

    local messageData = {
        username = "QB Logs",
        embeds = {{
            title = title,
            color = colorCode,
            footer = { text = os.date("%c") },
            description = message
        }}
    }

    PerformHttpRequest(webHook, function(err, text, headers)
        if err ~= 200 then
            print("^1[QB Logs] ERROR: Failed to send log to Discord. HTTP Code: " .. tostring(err) .. "^0")
        end
    end, 'POST', json.encode(messageData), { ['Content-Type'] = 'application/json' })
end)

RegisterCommand("testlog", function(source, args, rawCommand)
    if Config.DebugCommand then
        local testMessage = {
            username = "Test Logger",
            embeds = {{
                title = "🛠️ Debug Log Test",
                color = Config.Colors["blue"],
                footer = { text = os.date("%c") },
                description = "**Success!** This is a test log message from `/logtest`."
            }}
        }
        
        local webhook = Config.Webhooks["default"]
        if webhook and webhook ~= "" then
            PerformHttpRequest(webhook, function(err, text, headers)
                if err == 200 or err == 204 then
                    print("^2[LOG TEST] Success! A test log has been sent to Discord.^0")
                else
                    print("^1[LOG TEST] ERROR: Failed to send test log to Discord. HTTP Code: " .. tostring(err) .. "^0")
                end
            end, 'POST', json.encode(testMessage), { ['Content-Type'] = 'application/json' })
        else
            print("^1[LOG TEST] ERROR: No webhook set in Config.Webhooks['default']!^0")
        end
    else
        print("^1[LOG TEST] ERROR: Debug mode or DebugCommand is disabled!^0")
    end
end, false)


