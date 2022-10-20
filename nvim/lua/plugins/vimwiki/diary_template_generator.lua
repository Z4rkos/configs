#!/usr/bin/lua

local school_days = { "Monday", "Tuesday", "Wednesday", "Thursday" }

local templates_path = "/home/z4/.config/nvim/lua/plugins/vimwiki/templates/"

local school_template = "schoolday"
local weekend_template = "weekend"

local date = os.date("%d-%m-%y")
local day = os.date("%A")

local title = string.format("= %s, %s =", date, day)


-- Check if the file exists
local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end


local function print_from(file)
    print(io.open(file):read("a"))
end

-- Checks days and sets the right template
local function get_template()
    for _, school_day in ipairs(school_days) do
        if school_day == day then
            return school_template
        end
    end
    return weekend_template
end

-- Run
local function main()
    local template = templates_path..get_template()
    if file_exists(template) then
        print(title)
        print_from(template)
    else
        print("Could not find template: "..template)
    end
end

main()
