-- Loot an object from a container and put it in a specific bag.
-- This alias requires the 'put_get_path' script.

-- Pattern: ^loot ([\w\-]+)[ ]?(.*)$
-- Command: EMPTY

local lootObject = matches[2]
local source = matches[3]
local lootBag = '/body/backpack/bag'

if lootObject == 'gold' then
  getPath('/room/' .. source .. '/' .. lootObject)
else
  movePath('/room/' .. source, lootBag, lootObject, true, true)
end