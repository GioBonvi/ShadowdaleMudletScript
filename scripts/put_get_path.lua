-- These functions let you take a place objects from and into
-- any container in the game.
-- The basic idea is to express the position of an object as a UNIX
-- path: your inventory is the root (/), the room you are in is /room, your
-- body is /body and your hands are /hand.
-- E.g.
--  '/room/bag/loaf' -> a loaf is in a bag in the room
--  '/loaf' -> a loaf is in your inventory
--  '/body/backpack/sack/loaf' -> a loaf is in a sack in a backback you are wearing
--  '/backpack/sack/loaf' -> a loaf is in a sack in a backback in your inventory
--  '/body/earring' -> you are wearing an earring
--  '/hand/dagger' -> you are hold/wielding a dagger



-- Move an object from a path to another.
--
-- Parameters:
--  sourcePath (string): the path from which the object is taken;
--  targetPath (string): the path the object is put into;
--  object (string): the name of the object to move;
--  cleanSource (bool): wether to put back all the containers of sourcePath
--                      emptied to get the object
--  setupTarget (bool): wehter to empty all the containers of targetPath before
--                      putting the object
--
-- Examples:
--  movePath('/room/bag/sack','/body/backpack', 'loaf', true, true)
--    -- This is the get part --
--    get sack bag
--    get loaf sack
--    -- This is the cleanSource=true part --
--    put sack bag
--    -- This is the setupTarget=true part --
--    rem backpack
--    -- This is the put part --
--    put loaf backpack
--    wear backpack
function movePath(sourcePath, targetPath, object, cleanSource, setupTarget)
  getPath(sourcePath .. '/' .. object)
  if cleanSource then
    putPath(sourcePath)
  end
  if setupTarget then
    getPath(targetPath)
  end
  putPath(targetPath .. '/' .. object)
end

-- HELPING FUNCTIONS

-- Take an object into your inventory.
-- This leaves all the "emptied" containers in your inventory
-- that will be used by setPath() (see below).
function getPath(path)
  local i
  local list = split(path, '/')
  for i=2,#list do
    local target = list[i]
    local source = list[i -1]
    if source == 'body' or source == 'hand' then
      send('rem ' .. target)
    elseif source == 'room' and #list == 2 then
      send('get ' .. target)
    elseif source == 'room' then
      -- do nothing
    else
      send('get ' .. target .. ' ' .. source)
    end
  end
end

-- Put an object into a path from your inventory.
-- This assumes you have all the "empty" containers in your inventory
-- that have been left by getPath() (see above).
function putPath(str)
  local i
  local list = split(str, '/')
  for i=#list,2,-1 do
    local target = list[i]
    local source = list[i -1]
    if source == 'body' then 
      send('wear ' .. target)
    elseif source == 'hand' then
      send('hold ' .. target)
    elseif source == 'room' and #list == 2 then
      send('drop ' .. target)
    elseif source == 'room' then
      -- do nothing
    else
      send('put ' .. target .. ' ' .. source)
    end
  end
end