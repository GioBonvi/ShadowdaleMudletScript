-- This alias overrides and extend the 'mem' command.
-- This alias requires all the '/memorizer/' triggers.

-- Pattern: ^mem '(.+)'$
-- Command: EMPTY

-- Syntax: mem 'spell1name*times,spell2name*times...'
--         Omitting the '*times' part is interpreted as '*1'.

-- You will keep studying until you have memorized all
-- the specified spells or run out of memory.

-- Empty the spell list.
memorizer = {}

-- Populate the spell list.
local i, temp, spell, times
for i,temp in ipairs(split(matches[2], ',')) do
  spell, times = string.match(temp, '(.+)\*(%d+)')
	if spell == nil then
	  spell = temp
		times = "1"
	end
  for i=1,tonumber(times) do
	  table.insert(memorizer, spell)
	end
end

-- Start studying the first spell.
send('mem \'' .. memorizer[#memorizer] .. '\'')