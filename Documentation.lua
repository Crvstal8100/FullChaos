--[[
local FullChaos = loadstring(game:HttpGet('https://raw.githubusercontent.com/Crvstal8100/FullChaos/main/Main.lua'))()
local UI = FullChaos:CreateUI(Options: {Cooldown: number, Name: string})

HOW TO CREATE AN EVENT:
1:
local Event = UI:CreateEvent({
  ["Name"] = 'EVENT_NAME', -- This will be shown on the text.
  ["Duration"] = 5, -- This makes it a loop for (5) seconds.
  ["Disappear"] = 3, -- DEFAULT: 0
  ["Callback"] = function()
      -- NOT OPTIONAL
  end,
  ["EndCallback"] = function()
      -- THIS IS OPTIONAL (ONLY POSSIBLE WITH THIS TYPE OF EVENT)
  end
})
2:
local Event = UI:CreateEvent({
  ["Name"] = 'EVENT_NAME2', -- This will be shown on the text.
  ["Disappear"] = 3, -- DEFAULT: 0
  ["Callback"] = function()
      -- NOT OPTIONAL
  end,
})
]]--
