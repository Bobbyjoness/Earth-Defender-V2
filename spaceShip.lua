ship = {}
ship.p1x = 80
ship.p1y = 250
ship.p2x = 80
ship.p2y = 320
ship.sx = 80
ship.sy = 250
ship.speed = 375
ship.shots = {}
game = {}
local shotCount = 0
ship.mag = 0
s1 = "Kenny"
p1 = "Steve"
p2 = "Johnson"
local p = ".png"
ship.singlePic = love.graphics.newImage("textures/"..s1..p)
ship.pic = love.graphics.newImage("textures/"..p1..p)
ship.pic2 = love.graphics.newImage("textures/"..p2..p)

function shipDraw()
	love.graphics.setColor(255,255,255)
	
	if gamestate == "multi-player" then
	
	 love.graphics.draw(ship.pic,ship.p1x,ship.p1y)
	 love.graphics.draw(ship.pic2,ship.p2x,ship.p2y)
	elseif gamestate == "mplaying" then
	 
	 love.graphics.draw(ship.pic,ship.p1x,ship.p1y)
	 love.graphics.draw(ship.pic2,ship.p2x,ship.p2y)
	elseif gamestate == "marcade" then
	
	 love.graphics.draw(ship.pic,ship.p1x,ship.p1y)
	 love.graphics.draw(ship.pic2,ship.p2x,ship.p2y)
	elseif gamestate == "playing" then
	 love.graphics.draw(ship.singlePic,ship.sx,ship.sy)
	else 
	 love.graphics.draw(ship.singlePic,ship.sx,mousey - 7)
	end
	
end
local start = 0
function shipMove(dt)
  if update == true then
  if boost == true then
   speed = boost else
    speed = speed end
   if gamestate == "playing" then
      if love.keyboard.isDown("down") then
       ship.sy = ship.sy + speed * dt
      end
      if love.keyboard.isDown("up") then
       ship.sy = ship.sy - speed * dt 
      end	
   else
    ship.sy = 250
   end 
   if gamestate == "mplaying" then
    if love.keyboard.isDown("down") then
     ship.p2y = ship.p2y + ship.speed * dt
    end
    if love.keyboard.isDown("up") then
     ship.p2y = ship.p2y - ship.speed * dt 
    end
    if love.keyboard.isDown("s") then
     ship.p1y = ship.p1y + ship.speed * dt
    end
    if love.keyboard.isDown("w") then
     ship.p1y = ship.p1y - ship.speed * dt 
    end
   end
   if gamestate == "marcade" then
    if love.keyboard.isDown("down") then
     ship.p2y = ship.p2y + ship.speed * dt
    end
    if love.keyboard.isDown("up") then
     ship.p2y = ship.p2y - ship.speed * dt 
    end
    if love.keyboard.isDown("s") then
     ship.p1y = ship.p1y + ship.speed * dt
    end
    if love.keyboard.isDown("w") then
     ship.p1y = ship.p1y - ship.speed * dt 
    end
   end
for i,v in ipairs(ship.shots) do
 v.x = v.x + dt * 300

  if v.x > 800 then
   table.remove(ship.shots,i)
  end
 end 
end
end
function shoot()
 if update == true then
  if magSize > 0 then
   shot = {}
   shot.y = ship.sy+ship.singlePic:getHeight()/2
   shot.x = ship.sx+ship.singlePic:getWidth()/2
   table.insert(ship.shots, shot)
   magSize = magSize - 1 
  end
 end
end
function reload(dt)
 if magSize < maxMag then
  start = start + 1 * dt
  if start > r then
   start = 0
   magSize = magSize + 1 
  end
 end
end
