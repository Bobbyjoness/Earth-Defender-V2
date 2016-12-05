function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
remEnemy = {}
remShot = {}
kc = 0
function shotUpdate()
 for i,v in ipairs(ship.shots) do
  for ii,vv in ipairs(enemy) do
   if vv.spawn == true then
    if CheckCollision(v.x,v.y,5,7,vv.x,vv.y + vv.pic:getHeight()/4,100,100) then
	 game.Exp = game.Exp + vv.expDrop
	 table.remove(enemy,ii)
	 table.remove(ship.shots, i)
	 kc = kc + 1
	 print(game.Exp)
    end
   end 
  end
 end
end
function map_collision()
	if ship.sx < 0 then
		ship.sx = 0
	end
	if ship.sy < 0 then
		ship.sy = 0
	end
	if ship.sy + ship.singlePic:getHeight() > 600 then
		ship.sy = 600 - ship.singlePic:getHeight() 
	end
	if ship.sx + ship.singlePic:getWidth() > 800 then
		ship.sx = 800 - ship.singlePic:getWidth() 
	end
end