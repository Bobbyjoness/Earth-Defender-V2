dt = love.timer.getDelta( )
function mouse_cords()
 for i,v in ipairs(options)do 
  mousex = love.mouse.getX()/v.sx
  mousey = love.mouse.getY()/v.sy
 end
end 
function volumeDown()
for i,v in ipairs(options) do
 if v.volume > .2 then
  v.volume = v.volume - .1
  
  for ii,vv in ipairs(text1) do
   if vv.id == 1 then
    love.audio.setVolume( v.volume )
    vv.text = v.volume * 10
   end
  end
   else for ii,vv in ipairs(text1) do
    if vv.id == 1 then
     love.audio.setVolume( 0 )
     vv.text = "0" 
	 v.volume = 0
    end
   end
  end
  for ii,vv in ipairs(button) do
   if vv.id == 13 then
     vv.x =400 + standard:getWidth(v.volume * 10) + 1
   end
  end
 end
end
function volumeUp()
for i,v in ipairs(options) do
 if v.volume <= .9 then
  v.volume = v.volume + .1
  
  for ii,vv in ipairs(text1) do
   if vv.id == 1 then
    love.audio.setVolume(v.volume)
	vv.text = v.volume*10
   end
  end
  for ii,vv in ipairs(button) do
   if vv.id == 13 then
    vv.x =400 + standard:getWidth(v.volume * 10) + 1
   end
  end
 end
 end
 end
function previous()
 for i,v in ipairs(text1) do
  if v.id == 4 then
   if s1 == "Kenny" then
    s1 = "Steve" 
   elseif s1 == "Steve" then
    s1 = "Marshall"
   elseif s1 == "Marshall" then
    s1 = "Johnson"
   else 
    s1 = "Kenny"
   end
   v.text = s1
  end
   for i,v in ipairs(button) do
    if v.id == 15
	 then v.x = 500 + standard:getWidth(s1) + 1
	end
   end
 end
  local p = ".png"
   ship.singlePic = love.graphics.newImage("textures/"..s1..p)
end
function nextShip()
 for i,v in ipairs(text1) do
  if v.id == 4 then
   if s1 == "Kenny" then
    s1 = "Johnson"
   elseif s1 == "Johnson" then
    s1 = "Marshall"
   elseif s1 == "Marshall" then
    s1 = "Steve"
   else 
    s1 = "Kenny"
   end
   v.text = s1
  end
   for i,v in ipairs(button) do
    if v.id == 15
	 then v.x = 500 + standard:getWidth(s1) + 1
	end
   end
 end
  local p = ".png"
   ship.singlePic = love.graphics.newImage("textures/"..s1..p)
end
function previousP1()
 for i,v in ipairs(text1) do
  if v.id == 6 then
   if p1 == "Kenny" then
    p1 = "Steve" 
   elseif p1 == "Steve" then
    p1 = "Marshall"
   elseif p1 == "Marshall" then
    p1 = "Johnson"
   else 
    p1 = "Kenny"
   end
   v.text = p1
  end
   for i,v in ipairs(button) do
    if v.id == 18
	 then v.x = 400 + standard:getWidth(p1) + 1
	end
   end
 end
  local p = ".png"
   ship.pic = love.graphics.newImage("textures/"..p1..p)
end
function nextP1()
 for i,v in ipairs(text1) do
  if v.id == 6 then
   if p1 == "Kenny" then
    p1 = "Johnson"
   elseif p1 == "Johnson" then
    p1 = "Marshall"
   elseif p1 == "Marshall" then
    p1 = "Steve"
   else 
    p1 = "Kenny"
   end
   v.text = p1
  end
   for i,v in ipairs(button) do
    if v.id == 18
	 then v.x = 400 + standard:getWidth(p1) + 1
	end
   end
 end
  local p = ".png"
   ship.pic = love.graphics.newImage("textures/"..p1..p)
end
function previousP2()
 for i,v in ipairs(text1) do
  if v.id == 8 then
   if p2 == "Kenny" then
    p2 = "Steve" 
   elseif p2 == "Steve" then
    p2 = "Marshall"
   elseif p2 == "Marshall" then
    p2 = "Johnson"
   else 
    p2 = "Kenny"
   end
   v.text = p2
  end
   for i,v in ipairs(button) do
    if v.id == 20
	 then v.x = 400 + standard:getWidth(p2) + 1
	end
   end
 end
  local p = ".png"
   ship.pic2 = love.graphics.newImage("textures/"..p2..p)
end
function nextP2()
 for i,v in ipairs(text1) do
  if v.id == 8 then
   if p2 == "Kenny" then
    p2 = "Johnson"
   elseif p2 == "Johnson" then
    p2 = "Marshall"
   elseif p2 == "Marshall" then
    p2 = "Steve"
   else 
    p2 = "Kenny"
   end
   v.text = p2
  end
   for i,v in ipairs(button) do
    if v.id == 20
	 then v.x = 400 + standard:getWidth(p2) + 1
	end
   end
 end
  local p = ".png"
   ship.pic2 = love.graphics.newImage("textures/"..p2..p)
end
function music()
for i,v in ipairs(options) do
   love.audio.setVolume( v.volume )
end 
 if gamestate == "start menu" then
  love.audio.play(openingTheme)
 else
  love.audio.stop(openingTheme)
 end
end
function gameClock()
 if update == true then
  Tick = Tick + (1 * (dt/60))
 end
end

function saveOptions()
 for i,v in ipairs(textBox) do
  for ii,vv in ipairs(options) do 
  if v.id == 26 then
   vv.width = v.text 
  end  
   vv.height = vv.width*.75 
   vv.sx = vv.width/800
   vv.sy = vv.height/600  
save.Overwrite(options,'config') 
  love.window.setMode( tonumber(vv.width), tonumber(vv.height) )
  print(tonumber(vv.height))
  end
 end 
end 
function loadOptions()
 options = save.Load('config')
 if options == false then
  options = {}
  table.insert(options,{volume = .1,height = 600,width = 800,sx = 1,sy = 1})
 end
end
function bounceEffect(size)
if gamestate == "credits" then
 for i,v in ipairs(text1) do
  if v.id == 10 then
   if Tick >= 50 then
   v.font = large
   end
  end
  end
  end
 end
function textScrolling(speed,group)
for i,v in ipairs(group) do
  for ii,vv in ipairs(text1) do
   if vv.gamestate == gamestate then
    if vv.id == v.id   then
     vv.y = vv.y + speed
    end
   end
  end  
 end 
end
function textGrouping(id,group)
 table.insert(group,{id = id})
end

function spawnRandom()
local r = love.math.random( 550 )
return r
end
function saveGame1()
 for i,v in ipairs(textBox) do
  if v.id == 25 then
   save.Overwrite(logs,'Logs')
   game = {}
   game.s1 = s1
   game.onLevel = 0
   game.uPoints = 0
   game.Exp = 0
   game.score = 0
   game.speed = 100
   game.health = 10
   game.sheild = 10
   game.damage = 5
   game.bombs = 0
   game.boost = 0
   game.magSize = 20
   game.RoF = 1 -- rof == rate of fire
   game.RoR = 1
   -- ror == rate of reload
   game.upgradeCode = "S1M1R1B0Bst0Sh1H1D1" 
   
   -- S1 is speed tier 1 m1 is magizine tier 1 r1 = rate of fire tier 1 b0 is bombs tier 0 bst is boost tier 0
   --sh1 is shield tier 1 h1 is Health tier 1
  ok = save.Create(game,v.text)
    if ok == false then
     print'save already exist'
	 for i,v in ipairs(textBox) do
      if v.id == 25 then
	   love.audio.play(alert)
	   v.text = 'Save Already Exists'
	  end
	 end
	else 
	 save.Create(leveled,v.text..'levels')
     sfl = v.text
     gamestate = 'pre1'
     LoadGame()
     save.LogEnter(v.text)
   end
  end
 end  
end
 speed = 0
 health = 0
 sheild = 0
 damage = 0
 bombs = 0
 boost = 0
 magSize = 0
 maxMag = 0
 RoF = 0
 onLevel = 0
 Exp = 0
 uPoints = 0
 score = 0--]]
function LoadGame()
 game = save.Load(sfl)
 speed = game.speed
 health = game.health
 sheild = game.sheild
 damage = game.damage
 bombs = game.bombs
 boost = game.boost
 magSize = game.magSize
 maxMag = game.magSize
 RoF = game.Rof
 s1 = game.s1
 onLevel = game.onLevel
 Exp = game.Exp
 uPoints = game.uPoints
 score = game.score
 r = game.RoR
end
function loadFromLog(e)
print'start'
 local j = logs[e]
 print(j.logs)
 game = save.Load(j.logs) 
 sfl = j.logs
 gamestate = 'start'
 j = nil
 loadLevels()
 print(sfl)
end
function loadLevels()
 leveled = save.Load(sfl..'levels') 
 print'finish'
 print(sfl)
end
function restorePause()
 if gamestate ==  'playing' then
 else
 pause = false
 end 
 update = not pause
 onComandButton.UpdateCondition(pause,5)
end
function deleteSave(id)
 for i,v in ipairs(scrollButton) do
  if v.id == id then
   save.Remove(v.text..'.txt')
   table.remove(logs,id/100)
  end
 end
end 






















