levels = {}
leveled = {}
winText = ' '
function levels.Win()
 for i,v in ipairs(leveled) do
  if v.level == level then
   if v.kc <= kc then
    winText = v.text
	kc = 0
	levels.Unlock(level + 1)
	gamestate = 'win'
	save.Overwrite(game,sfl)
	enemy = {}
	ship.shots = {}
   end	
  end   	 
 end
 for i,v in ipairs(text1) do
  if v.id == 20 then
   v.text = winText
  end
 end  
end
function levels.Select(l)
 enemyLoad(l)
 level = l
 Tick = 0
 spawnCount = 0
 kc = 0
 LoadGame()
 gamestate = "playing"
end 
function levels.Next()
 levels.Select(level + 1)
end
function levels.Unlock(l)
 for i,v in ipairs(leveled) do
  if v.level == l then
   v.unlocked = true
  end
 end  
end
function levels.Save()
save.Overwrite(leveled,sfl..'levels')
end
function levels.Build(l,k,m,u)
 table.insert(leveled,{level = l, kc = k, text = m, unlocked = u})
 print'Build Susceful'
end