-- Since I use uwsm
local path = string.format("%s/.config/uwsm", os.getenv("HOME"))

local env = { entries = {} }

function env.set(key, value)
    hl.env(key, value)
    env.entries[#env.entries + 1] = "export " .. key .. "=" .. value
end

function env.write()
    local env_path = string.format("%s/env", path)
    os.execute(string.format([[mkdir -p "%s"]], path))

    local file = io.open(env_path, "w")
    if file then
        file:write(table.concat(env.entries, "\n") .. "\n")
        file:close()
    end
end

return env
