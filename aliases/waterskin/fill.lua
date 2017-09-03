-- Fill waterskin in the backpack.
-- This alias requires the 'put_get_path' script.

-- Pattern: ^waterfill$
-- Command: EMPTY

local water = 'waterskin'
local waterPath = '/body/backpack/'

movePath(waterPath, '/', water)
send('fill ' .. water)
movePath('/', waterPath, water)
