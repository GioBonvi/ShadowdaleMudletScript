-- Study the next spell if you memorized the current one.
-- This trigger requires the 'memorizer' alias.
-- Triggers:
--  1 (Perl regex): ^You commit (.+) to memory

-- Remove the memorized spell.
memorizer[#memorizer] = nil
-- Check if there is another spell to memorize.
if #memorizer > 0
then
  -- Memorize the new spell.
  send("mem '" .. memorizer[#memorizer] .. "'")
end