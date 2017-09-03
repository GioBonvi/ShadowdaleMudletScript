-- Drink n times from the waterskin in the backpack.
-- This alias requires the 'put_get_path' script.

-- Pattern: ^waterdrink (\d+)$
-- Command: EMPTY

local times = matches[2]
local water = 'waterskin'
local waterPath = '/body/backpack/'

movePath(waterPath, '/', water)
for i=1,times do
	send('drink ' .. water)
end
movePath('/', waterPath, water)
