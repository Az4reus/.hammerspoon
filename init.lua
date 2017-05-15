hs.hotkey.bind({"shift", "ctrl"}, "R", function()
    hs.reload()
    hs.notify.new({title="Config reloaded"}):send()
end)

-- Iterm2 automation

hs.hotkey.bind({"shift", "ctrl"}, "D", function()
    local spawnNewTerminal = [[
        tell application "iTerm2"
            create window with default profile
            tell current session in current window
                set columns to 80
                set rows to 25
            end tell
        end tell
    ]]
    local success, object, description = hs.osascript.applescript(spawnNewTerminal)
    if not success then
        hs.notify.new({title="Spawning new Terminal not successful :(",
            informativeText="Error message: " .. description}):send()
    end
end)