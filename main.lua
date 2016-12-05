require "button"
require "id"
require "buttons"
require "background"
require "ids"
require "functions"
require "spaceShip"
require "simpleEnemy"
require "enemies"
require "Tserial"
require "imagesSound"
require "objectCollision"
require "colors"
require 'lsave'
require 'levels'
--require 'gampadModule'
--#(TAbleName) returns number of entries in a lua table.
function love.load()
 levels.Build(1,15,"You Unlocked Level 2",true)
 --[[levels.Build(2,10,"You Unlocked Level 3",false)
 levels.Build(3,20,'You Unlocked Level 4',false)
 levels.Build(4,20,'You Unlocked Level 5',false)--]]
 gamestate = "start menu"
 imagesSoundFontLoad()
 --buttonSpawn(240,130,"Continue Game",standard,6,"start","no",0,0,0,"text")
 buttonSpawn(271,320,"Start Game",standard,25,"new","no",0,0,0,"text")
 loadOptions()
 for i,v in ipairs(options) do 
  love.window.setMode( v.width, v.height )
 end 
 idLoad()
 pause = false
 level2 = false
 --save.Create(ship,'j')
 buttonLoad()
 starGenorator()
 groupLoad()
 Tick = 0
 update = true
 logs = {}
 save.LogCreate()
 logs = save.LogGet()
 sfl = f
 sx,sy =1,1
 local id = 0
 for i,v in ipairs(logs) do
  id = id + 1
  scrollBox.CreateButton(v.logs,standard,'scrollState',red,white2,rc,id - 1,250,165,id * 100)
 end
end

function love.update(dt)
 dt = math.min(dt, 1/60)
if gamestate == 'main menu' then
 game = {}
 sfl = nil 
end 
if gamestate == 'new' then
 game = {}
 sfl = nil 
end 
--save.auto(options,'config.txt')
enemySpawn(dt)
enemyUpdate(dt) 
shotUpdate()
--buttonSelect()
mouse_cords()
buttonCheck()
onComandButton.Check()
starUpdate(dt)
shipMove(dt)
music()
gameClock()
reload(dt)
textScrolling(-.25,credits)
map_collision()
scrollBox.Update()
levels.Win()
restorePause() 
idWarmUp()
end

function love.draw() 
for i,v in ipairs(options) do
 love.graphics.scale(v.sx,v.sy)
 scalex = v.sx
 scaley = v.sy
end 
backgroundDraw()
buttonDraw()
shipDraw()
enemyDraw()
scrollBox.Draw()
 for i,v in ipairs(ship.shots) do 
  if gamestate == 'playing' then
   love.graphics.setColor(255,255,255,255)
   love.graphics.rectangle("fill", v.x, v.y, 5,7)
  end
 end
textBox.Draw()
love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
onComandButton.Draw()
for i = 1,magSize do
 if gamestate == 'playing' then
  love.graphics.setColor(red)
  love.graphics.rectangle('fill',10 * i + 5,10,8,30)
 end
end 
end


function love.mousepressed(x,y,button)
 --[[buttonClickText(x,y,button)
 buttonClickPic(x,y,button)
 onComandButton.ClickText(x,y,button)
 onComandButton.ClickPic(x,y,button)]]

 textBox.Select(x/scalex,y/scaley,button)
 scrollBox.Scroll(x/scalex,y/scaley,button)
 --restorePause()
end

function love.mousereleased(x,y,button)
scrollBox.ScrollReleased(x/scalex,y/scaley,button)
if button == 'r' then
 onComandButton.UpdateCondition(subButton,16,true,mousex,mousey)
end 
 buttonClickText(x/scalex,y/scaley,button)
 buttonClickPic(x/scalex,y/scaley,button)
 onComandButton.ClickText(x/scalex,y/scaley,button)
 onComandButton.ClickPic(x/scalex,y/scaley,button)
 if gamestate == "start menu" then
  gamestate = "main menu"
 end
end

function love.keypressed(key)
 if gamestate == "start menu" then
  gamestate = "main menu"
 end
 if key == "escape" then 
  gamestate = "main menu"
  level = 0
 end 
 if gamestate == "playing" then
  if key == " " then
   shoot()
   print('hi')
  end
 end  
 textBox.Return(key)
end
   


function love.keyreleased(key)
 if gamestate == 'playing' then
  if key == 'p' then
   pause = not pause
   onComandButton.UpdateCondition(pause,5)
  end
 end
 


end

function love.quit()



end

function love.textinput(t)
 textBox.Type(t)
end
