-- Try studying this spell again if you failed.
-- This trigger requires the 'memorizer' alias.
-- Triggers:
--  1 (Perl regex): ^You lost your concentration while studying

send("mem '" .. memorizer[#memorizer] .. "'")