function buttonLoad()
--buttonSpawn makes new button. 240 = x, 130 = y, Start game = pic(can be text or image),
--standard = font(for text), 2 = id(to tell the button what to do), menu = gamestate(to be drawn under),
--yes = background(if button sets background color), 69 = r, 91 = g, 200 = b(background color)
--text = tipe(if it is text or pic)

--gamestate start menu
textSpawn(250,425,standard,"Press Any Key to Begin","start menu",10)
textSpawn(240,130,large,"Earth Defenders","start menu",11)
textSpawn(240,130,large,winText,"win",20)
--gamestate main menu
buttonSpawn(250,385,"Exit Game",standard,1,"main menu","no",0,500,0,"text",5)
buttonSpawn(240,130,"Single Play",standard,2,"main menu","no",69,91,200,"text",1)
buttonSpawn(276,255,"Help/Options",standard,3,"main menu","no",0,0,0,"text",3)
buttonSpawn(265,195,"Multi-player",standard,10,"main menu","no",0,0,0,"text",2)
buttonSpawn(271,320,"Credits",standard,11,"main menu","no",0,0,0,"text",4)

--gamestate options
textSpawn(250,130,standard,"Volume","options",2)
textSpawn(265,195,standard,'Window Width','options',18)
buttonSpawn(250,385,"Main Menu",standard,5,"options","no",0,0,0,"text")
--textSpawn(265,195,standard,"GamePad","options",16)
for i,v in ipairs(options) do 
 --buttonSpawn(265 + 5 + standard:getWidth("GamePad"),195,toggle(),standard,24,"options","no",0,0,0,"text")
 textBox.Create(265 + 5 + standard:getWidth("Window Width"),195,"88888","options",white,v.width,26)
 textSpawn(400,130,standard, v.volume * 10,"options",1)
 buttonSpawn(375,130,"<",standard,12,"options","no",0,0,0,"text")
 buttonSpawn(400 + standard:getWidth(v.volume * 10),130,">",standard,13,"options","no",0,0,0,"text")
 buttonSpawn(271,320,"Save Options",standard,21,"options","no",0,0,0,"text")
end

--gamestate start
buttonSpawn(240,130,"New Game",standard,7,"start","no",0,0,0,"text")
buttonSpawn(265,195,"Continue",standard,30,"start","no",0,0,0,"text")
buttonSpawn(250,385,"Main Menu",standard,5,"start","no",0,0,0,"text")
buttonSpawn(276,255,"Load Game",standard,8,"start","no",0,0,0,"text")
buttonSpawn(271,320,"Arcade Play",standard,9,"start","no",0,0,0,"text")

--gamestate new
textSpawn(240,130,standard,"Pick Your Ship","new",3)
textSpawn(500,130,standard,p1,"new",4)
buttonSpawn(470,130,"<",standard,14,"new","no",0,0,0,"text")
buttonSpawn(500 + standard:getWidth(p1) + 1,130,">",standard,15,"new","no",0,0,0,"text")
textSpawn(265,195,standard,"Name your Hero","new",17)
--gamestate playing
onComandText.Create(20,550,standard,'Health','playing',1,true)
--gamestate multi-player
textSpawn(276,130,standard,"Player 1 Pick Your Ship","multi-player",5)
textSpawn(400,195,standard,p1,"multi-player",6)
buttonSpawn(370,195,"<",standard,17,"multi-player","no",0,0,0,"text")
buttonSpawn(400 + standard:getWidth(p1) + 1,195,">",standard,18,"multi-player","no",0,0,0,"text")
textSpawn(276,255,standard,"Player 2 Pick Your Ship","multi-player",7)
textSpawn(400,320,standard,p2,"multi-player",8)
buttonSpawn(370,320,"<",standard,19,"multi-player","no",0,0,0,"text")
buttonSpawn(400 + standard:getWidth(p2) + 1,320,">",standard,20,"multi-player","no",0,0,0,"text")
buttonSpawn(250,385,"Co-op Game",standard,22,"multi-player","no",0,0,0,"text")
buttonSpawn(500,385,"Arcade Game",standard,23,"multi-player","no",0,0,0,"text")
buttonSpawn(355,385+65,"Main Menu",standard,5,"multi-player",no,0,0,0,"text")
textSpawn(450,385,standard,"or","multi-player",9)

-- gamestate credits
textSpawn(300,730,large,"Ghost Gamez","credits",14)
textSpawn(240,700,small,"Game Developed By","credits",15)
textSpawn(264,780,small,"Lead Developer","credits",12)
textSpawn(320,820,standard,"David Serrano","credits",13)

-- gamestate win
buttonSpawn(265,195,"Next Level",standard,29,"win","no",0,0,0,"text")
buttonSpawn(250,385,"Main Menu",standard,5,"win","no",0,0,0,"text")
buttonSpawn(276,255,"Upgrade Shop",standard,4,"win","no",0,0,0,"text")
buttonSpawn(271,320,"Return To Level Selected",standard,9,"win","no",0,0,0,"text")
-- end
buttonSpawn(240,130,level1,standard,27,"pre1","no",0,0,0,"pic")
onComandButton.Create(300,130,level1,standard,28,"pre1","no",0,0,0,"pic",1,level2)
onComandButton.Create(300,130,'Main Menu',standard,5,'playing',"no",0,0,0,"text",1,pause)
onComandButton.Create(300,130,'Main Menu',standard,6,'playing',"no",0,0,0,"text",1,pauseB)
textBox.Create(289,255,"WWWWWWWWWWW","new",white,"SaveFileName",25)
scrollBox.Create(250,165,standard:getWidth('WWWWWWWWWWWW'),300,'load',white,red,'scrollState')
onComandButton.Create(300,130,'Delete',standard,16,"load","no",0,0,0,"text",1,subButto)

textSpawn(250,130,standard,"Select your Game Save","load",2)
end
function groupLoad()


credits = {}
 textGrouping(12,credits)
 textGrouping(13,credits)
 textGrouping(14,credits)
 textGrouping(15,credits)
 








end

