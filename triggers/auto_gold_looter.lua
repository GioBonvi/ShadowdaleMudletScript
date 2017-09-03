-- Automatically loot the gold from the corpse of a defeated enemy.
-- Triggers:
--  1 (Perl regex): ^(?:The |A |An )?(.+) is dead! R\.I\.P\.$

-- Note this does not always work due to:
--  1. mobs changing name when dying (e.g. zombie -> pile of dust and bones)
--  2. displayed names not corresponding exactly to theur callable keywords

send('get all.gold ' .. string.gsub(matches[2], ' ', '-'))