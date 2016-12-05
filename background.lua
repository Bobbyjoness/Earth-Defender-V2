
function starGenorator()
 sizeAH = 2
 sizeAW = 4
 sizeBH = 4
 sizeBW = 8
 sizeCH = 5
 sizeCW = 7
 stars = {}
 c = 0
 for i = 1,300 do
 
 local x = love.math.random(0,800)
 local y = love.math.random(1,600)
 local r = love.math.random(1,3)
 if r == 1 then 
  H = sizeAH
  W = sizeAW
 elseif r == 2 then
  H = sizeBH
  W = sizeBW
 else
  H = sizeCH
  W = sizeCW
 end
 star = {}
 star.y = y
 star.x = x
 star.H = H
 star.W = W
 table.insert(stars, star)
 end
end 
function starDraw()
 			love.graphics.setColor(255,255,255,255)
for i,v in ipairs(stars) do
 love.graphics.rectangle("fill", v.x, v.y, v.W, v.H)
end 
 
end
function starUpdate(dt)
if update == true then
 for i,v in ipairs(stars) do
  v.x = v.x + 20 * dt
  if v.x > 800 then
		v.x =  love.math.random(-500,0)
end
end
end
end
 
function backgroundDraw()
love.graphics.setColor(255,255,255)
love.graphics.draw(background,0,0)
starDraw()
love.graphics.draw(backgroundE,0,0)
end