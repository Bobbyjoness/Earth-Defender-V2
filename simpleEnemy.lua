enemy = {}

function enemyCreate(n,hardness,level)
I = -1
 for i = 1,n do
  I = I + 1
  randomEnemyCreator(hardness,level,I)
 end
 wn = n*4/5
 levels.Build(level,wn,"You Unlocked Level"..level + 1,true)
end
spawnCount = 0
function enemySpawn(dt)
if update == true then
 for i,v in ipairs(enemy) do
  if v.level == level then
   if v.id == spawnCount then
	if v.rate <= Tick then
     v.x = 800
     v.y = spawnRandom()	 
	 v.spawn = true
	 spawnCount = spawnCount + 1
	end
   end 
  end
 end
 end
end--]] 

function enemyUpdate(dt)
if update == true then
 for i,v in ipairs(enemy) do
  if v.spawn == true then
   if v.direction == "left" then
    local speed = v.speed
     v.x = v.x - (dt * speed )
   end 
   if v.direction == "right" then
   end
   if v.direction == "up" then
   end
   if v.direction == "down" then
   end
   if v.direction == "slope" then
   end
  end
  if v.x < -917 then
   table.remove(enemy,i)
  end 
 end
 end
 if gamestate == 'playing' then
 else
  for i,v in ipairs(enemy) do
   table.remove(enemy,i)
  end
 end  
end  
function randomEnemyCreator(dificulty,level,I)
 local badguy = {}
 local r1 = random1(dificulty)
 local r2 = random2()
 badguy.x = spawnRandom()
 badguy.pic = picRandom(dificulty,r1)
 badguy.speed = (50*dificulty)*r2 
 badguy.direction = "left"
 badguy.spawn = false
 badguy.rate = 5/(dificulty*2) + 5/(dificulty*5)*I
 badguy.id = I
 badguy.level = level
 badguy.expDrop = 3*dificulty
 table.insert(enemy,badguy)

end
function picRandom(d,r)
return badGuy
end
function random1(h)
 return love.math.random(2*h)
end
function random2()
 return love.math.random(3)
end
function enemyDraw()
if gamestate == 'playing' then
 for i,v in  ipairs(enemy) do
  if v.level == level then
   if v.spawn == true then
    love.graphics.draw(v.pic,v.x,v.y)
   end	
  end
 end 
 end
end
    
   
   
