-- Perform a series of action to put you in a certain mode (for example
-- "mode study on" means sit, take a +INT object from inventory and hold it)
-- This alias requires the 'put_get_path' script.

-- Pattern: ^mode (\w+) (\w+)$
-- Command: EMPTY


local mode = matches[2]
local status = matches[3]

if mode == 'study' then
  local light = 'green-orb'
  local backpack = '/body/backpack'
  local staff = 'runed-staff'
	if status == 'on' then
	  -- You need a free hand to hold the runed staff.
		movePath('/hand', '/', light)
		movePath(backpack, '/hand', staff, true, false)
		send('sit')
	elseif status == 'off' then
		movePath('/hand', backpack, staff, false, true)
		movePath('/', '/hand', light)
		send('stand')
	else
		cecho('<red>ERROR: mode ' .. mode .. ' [on/off]\n')
	end
else
	cecho('<red>ERRORE: mode "' .. mode .. '" non conosicuto\n')
	cecho('<red>ERRORE: mode MODENAME [on/off]\n')
end