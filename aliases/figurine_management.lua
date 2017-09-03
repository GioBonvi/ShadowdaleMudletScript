-- Activate or deactivate a figurine.
-- This alias requires the 'put_get_path' script.

-- Pattern: ^fig ([\w\-]+) (\w+)$
-- Command: EMPTY

local figName = matches[2]
local mode = matches[3]

local light = '/hand/green-orb'
local figContainer = '/body/backpack'
local recognisedName = false
local nameList = {}

local nameConversion = {
  wolf = 'wolf-figurine'
}

for name,correctName in pairs(nameConversion) do
  table.insert(nameList, name)
  if figName == name then
	  figName = correctName
		recognisedName = true
		break
	end
end

if not recognisedName then
  cecho('<red>ERROR: the "' .. figName .. '" figurine is unknown.\n')
	cecho('These are the only valid names:\n')
	display(nameList)
end

if mode == 'on' then
  -- You need a hand to be free to hold the figurine.
	getPath(light)
	movePath(figContainer, '/hand', figName, true, false)
	send('activate ' .. figName)
	putPath(light)
elseif mode == 'off' then
	send('deactivate ' .. figName)
	movePath('/room/', figContainer, figName, false, true)
else
  cecho('<red>ERROR: fig NAME [on/off]\n')
end