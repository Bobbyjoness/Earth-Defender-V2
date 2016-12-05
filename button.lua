button = {}
text1 = {}
textBox = {}
scrollBox = {}
scrollButton = {}
scrollText = {}
scrollBar = {}
onComandButton = {}
onComandText = {}
dragging = {active = false, diffy = 0}
local a = 1
function textSpawn(x,y,font,text, gamestate, id)
 table.insert(text1, {x = x, y = y, font = font, text = text, gamestate = gamestate,id = id})
end
function buttonSpawn(x,y,pic,font,id,gamestate,setBackground,r,g,b,tipe,rank)
 table.insert(button, {y = y, x = x, pic = pic,font = font, id = id, gamestate = gamestate, setBackground = setBackground, r = r, g = g, b = b, tipe = tipe, rank = rank, mouseover = false })
end
--[[function buttonSelect()
 for i,v in ipairs(button) do 
  for ii,vv in ipairs(options)do
   if v.gamestate == gamestate then
	if vv.gamepad == true then 
	 if b >= 1 then
	  if b <= 2 then
	   a = a + 1
	  end 
	 end 
	end 
    if v.rank == a then
     v.mouseover = true
	else
     v.mouseovver =  false	
    end
   end
  end
 end
end]]
function buttonDraw()
 for i,v in ipairs(text1) do
   if v.gamestate == gamestate then
    love.graphics.setFont(v.font)
    love.graphics.print(v.text,v.x,v.y)
   end
   if v.gamestate == level then
    love.graphics.setFont(v.font)
    love.graphics.print(v.text,v.x,v.y)
   end
 end
 for i,v in ipairs(button) do
  if v.mouseover == false then
   love.graphics.setColor(255,255,255)
  end	
  if v.mouseover == true then
   love.graphics.setColor(255,0,0)
  end
  if gamestate  == v.gamestate then 
   if v.gamestate == gamestate  then
    if v.setBackground == "yes" then
     love.graphics.setBackgroundColor(v.r,v.g,v.b)
    end 	
	if v.tipe == "pic" then  
	 love.graphics.setColor(255,255,255)
     love.graphics.draw(v.pic,v.x,v.y)
	end
	if v.tipe == "text" then
     love.graphics.setFont( v.font )
	 love.graphics.print(v.pic,v.x,v.y)
	end 
   end	
  end
  if v.gamestate == level  then
   if v.setBackground == "yes" then
    love.graphics.setBackgroundColor(v.r,v.g,v.b)
   end 	
   if v.tipe == "pic" then  
	love.graphics.setColor(255,255,255)
    love.graphics.draw(v.pic,v.x,v.y)
   end
   if v.tipe == "text" then
    love.graphics.setFont( v.font )
	love.graphics.print(v.pic,v.x,v.y)
   end 
  end	
  
 end  
end   
function buttonClickText(x,y,mouse)
 if mouse == "l" then 
  for i,v in ipairs(button) do 
   if v.tipe == "text" then
    if v.gamestate == gamestate then
     if  x > v.x and
      x < v.x + v.font:getWidth(v.pic) and
      y > v.y and
      y < v.y + v.font:getHeight() then
       idCall(v.id)
	   love.audio.play(buttonClick1)
	   v.mouseover = false
	 end
    end	
	if v.gamestate == level then
     if  x > v.x and
      x < v.x + v.font:getWidth(v.pic) and
      y > v.y and
      y < v.y + v.font:getHeight() then
       idCall(v.id)
	   love.audio.play(buttonClick1)
	   v.mouseover = false
	 end
    end	
   end
  end
 end 
end
function buttonClickPic(x,y,mouse)
 if mouse == "l" then
  for i,v in ipairs(button) do
   if v.tipe == "pic" then
    if v.gamestate == gamestate then
     if  x > v.x and
      x < v.x + v.pic:getWidth() and
      y > v.y and
      y < v.y + v.pic:getHeight() then
      idCall(v.id)
	  love.audio.play(buttonClick1)
     end
    end
	 if v.gamestate == level then
     if  x > v.x and
      x < v.x + v.pic:getWidth() and
      y > v.y and
      y < v.y + v.pic:getHeight() then
      idCall(v.id)
	  love.audio.play(buttonClick1)
     end
    end
   end
  end
 end 
end
function buttonCheck()
 for i,v in ipairs(button) do
  for ii,vv in ipairs(options) do
   if vv.gamepad == false then
    if v.tipe == "pic" then 
     if v.gamestate == gamestate then
      if  mousex > v.x and
	   mousex < v.x + v.pic:getWidth() and
	   mousey > v.y and
	   mousey < v.y + v.pic:getHeight() then
	   v.mouseover = true
      else
	   v.mouseover = false
      end
     end
	 if v.gamestate == level then
      if  mousex > v.x and
	   mousex < v.x + v.pic:getWidth() and
	   mousey > v.y and
	   mousey < v.y + v.pic:getHeight() then
	   v.mouseover = true
      else
	   v.mouseover = false
      end
     end
    elseif v.tipe == "text" then
     if v.gamestate == gamestate then
      if mousex > v.x and
       mousex < v.x + v.font:getWidth(v.pic) and
       mousey > v.y and
       mousey < v.y + v.font:getHeight() then
       v.mouseover = true
	  else
       v.mouseover = false
	  end
     end
	 if v.gamestate == level then
      if mousex > v.x and
       mousex < v.x + v.font:getWidth(v.pic) and
       mousey > v.y and
       mousey < v.y + v.font:getHeight() then
       v.mouseover = true
	  else
       v.mouseover = false
	  end
	 end 
    end
   end
  end
 end 
end 

function textBox.Create(x,y,length,gamestate,c,text,id) --length is a string showing the max number of characters
 table.insert(textBox,{x = x ,y = y ,width = standard:getWidth(length) ,height = standard:getHeight() ,gamestate = gamestate ,c = c, text = text,id = id, selected = false})
end
function textBox.Select(x,y,mouse)
 if mouse == "l" then
  for i,v in ipairs(textBox) do
   if v.gamestate == gamestate then
    if  x > v.x and
     x < v.x + v.width and
     y > v.y and
     y < v.y + v.height then
     v.selected = true 
     v.text = ""
	 love.audio.play(buttonClick1)
    else
     v.selected = false	 
    end
   end
   if v.gamestate == level then
    if  x > v.x and
     x < v.x + v.width and
     y > v.y and
     y < v.y + v.height then
     v.selected = true 
     v.text = ""
	 love.audio.play(buttonClick1)
    else
     v.selected = false	 
    end
   end
  end
 end
end
function textBox.Draw()
 for i,v in ipairs(textBox) do
  if v.gamestate == gamestate then
   love.graphics.setColor(v.c)  
   love.graphics.rectangle("fill", v.x,v.y, v.width, v.height )
   love.graphics.setColor(0,0,0)
   love.graphics.print(v.text,v.x,v.y)
   if v.selected == true then
    love.graphics.setColor(255,0,0,255)
	love.graphics.rectangle("line",v.x - 1,v.y - 1,v.width + 1,v.height + 1)
	love.graphics.rectangle("line",v.x - 2,v.y - 2,v.width + 2,v.height + 2)
	love.graphics.rectangle("line",v.x - 3,v.y - 3,v.width + 3,v.height + 3)
   end	
  end
  if v.gamestate == level then
   love.graphics.setColor(v.c)  
   love.graphics.rectangle("fill", v.x,v.y, v.width, v.height )
   love.graphics.setColor(0,0,0)
   love.graphics.print(v.text,v.x,v.y)
   if v.selected == true then
    love.graphics.setColor(255,0,0,255)
	love.graphics.rectangle("line",v.x - 1,v.y - 1,v.width + 1,v.height + 1)
	love.graphics.rectangle("line",v.x - 2,v.y - 2,v.width + 2,v.height + 2)
	love.graphics.rectangle("line",v.x - 3,v.y - 3,v.width + 3,v.height + 3)
   end	
  end
 end
end 
function textBox.Type(t)
 for i,v in ipairs(textBox) do
  if v.selected == true then
   if standard:getWidth(v.text) < v.width - standard:getWidth('W') then
    v.text = v.text..t
   end
  end 
 end
end
function textBox.Return(key)
 for i,v in ipairs(textBox) do
  if v.selected == true then
   if key == "delete" or key == "backspace" then
    v.text = v.text:sub( 1, #v.text - 1 ) 
   elseif key == 'return' then
    v.selected = false
	idCall(v.id)
   else 
   end
  end   
 end
end 
function scrollBox.Create(x,y,width,height,gamestate,bc,sc,scrollState)-- bc is box color, sc is scroller color
 table.insert(scrollBox,{x = x, y = y, width = width, height = height, gamestate = gamestate, bc = bc,scrollState = scrollState})
 table.insert(scrollBar,{x = x + width - 20, y = y, width = 20,height = 40,sc = sc,scrollState = scrollState})
 
end 
function scrollBox.CreateButton(text,font,scrollState,tc,hc,rc,order,x,y,id)--tc is text color,hc is high light color,rc is selection box highlight color
 table.insert(scrollButton,{x = x,y = y + font:getHeight()*order + 5,text= text,font = font,scrollState = scrollState,tc = tc,hc = hc,rc = rc, inbox = false, mouseover = false,order = order,id = id})
end
function scrollBox.CreateText(text,font,scrollState,tc,order,x,y)
 table.insert(scrollText,{x = x,y = y + font:getHeight()*order, text = text, font = font, scrollState = scrollState, tc = tc, order = order, inbox = false, active = false, diffy = 0})
end
function scrollBox.Update()
 for i,v in ipairs(scrollBar) do
  for ii,vv in ipairs(scrollBox) do 
   if vv.gamestate == gamestate then
    scrollState = vv.scrollState
   end	
   for iii,vvv in ipairs(scrollButton) do
    if v.active then
     if  love.mouse.getY() - v.diffy > vv.y and love.mouse.getY() - v.diffy + v.height < vv.y + vv.height  then
      v.y = love.mouse.getY() - v.diffy
	  vvv.y = vv.y + vvv.font:getHeight()*vvv.order + 5 + (vv.y - v.y) 
	  
	 end
	end
    if vvv.inbox == true then	
	 if vvv.scrollState == scrollState then
      if mousex > vvv.x and
       mousex < vvv.x + vvv.font:getWidth(vvv.text) and
       mousey > vvv.y and
       mousey < vvv.y + vvv.font:getHeight() then
       vvv.mouseover = true
	  else
       vvv.mouseover = false
	  end
     end
	end 
	if vvv.y < vv.y or vvv.y+ vvv.font:getHeight() > vv.y + vv.height then
	 vvv.inbox = false 
	else 
	 vvv.inbox = true
	end 
   end
  end 
 end
end 
function scrollBox.Scroll(x,y,mouse)
 for i,v in ipairs(scrollBar) do  
  if mouse == "l" and y > v.y and y < v.y + v.height then
   v.active = true
   v.diffy = y - v.y
  end
 end 
 if mouse == "l" then 
  for i,v in ipairs(scrollButton) do 
   if v.scrollState == scrollState then
    if v.inbox == true then
     if  x > v.x and
      x < v.x + v.font:getWidth(v.text) and
      y > v.y and
      y < v.y + v.font:getHeight() then
      idCall(v.id)
 	  love.audio.play(buttonClick1)
 	  v.mouseover = false
	 end 
    end	
   end
  end
 end 
 --[[if mouse == 'r' then
  for i,v in ipairs(scrollButton) do 
   if v.scrollState == scrollState then
    if v.inbox == true then
     if  x > v.x and
      x < v.x + v.font:getWidth(v.text) and
      y > v.y and
      y < v.y + v.font:getHeight() then
      rightClicked = v.id
	  subButton = true
	 end 
    end	
   end
  end
  else
  subButton = false
 end]]
end
function scrollBox.ScrollReleased(x,y,mouse)
 for i,v in ipairs(scrollBar) do  
  if mouse == "l" then
   v.active = false
  end
 end
end
function scrollBox.Draw()
 for i,v in ipairs(scrollBox) do 
  for ii,vv in ipairs(scrollBar) do
   if v.gamestate == gamestate then
    love.graphics.setColor(v.bc)
    love.graphics.rectangle('fill',v.x,v.y,v.width,v.height)
	love.graphics.setColor(vv.sc)
    love.graphics.rectangle('fill',vv.x,vv.y,vv.width,vv.height) 
	for iii,vvv in ipairs(scrollButton) do
	 if vvv.inbox == true then
	  if vvv.mouseover == true then
       love.graphics.setColor(vvv.hc)
	  else
	   love.graphics.setColor(vvv.tc)
	  end 
      love.graphics.print(vvv.text,vvv.x,vvv.y)
	 end
    end 
   end	
  end 
 end 
end  

--[[function buttonssLoad()
 for i,v in ipairs(scrollBox) do
  for ii,vv in ipairs(scrollButton) do
   vv.x = v.x + 20
   vv.y = v.y + vv.font:getHeight()*vv.order
  end   
 end
end]]

function onComandButton.Create (x,y,pic,font,id,gamestate,setBackground,r,g,b,tipe,rank,condition)
 table.insert(onComandButton, {y = y, x = x, pic = pic,font = font, id = id, gamestate = gamestate, setBackground = setBackground, r = r, g = g, b = b, tipe = tipe, rank = rank, mouseover = false, condition = condition })
end
function onComandText.Create(x,y,font,text,gamestate,id,condition)
 table.insert(onComandText, {x = x, y = y, font = font, text = text, gamestate = gamestate,id = id,condition = condition})
end
function onComandText.UpdateCondition(conditional,id,updatecords,x,y)
 for i,v in ipairs(onComandText) do 
  if v.gamestate == gamestate then
   if v.id == id then
    v.condition = conditional
	if v.condition == true then
	 if updatecords == true then
	  v.x = x
	  v.y = y
	 end
    end	 
   end
  end
 end  
end
function onComandButton.UpdateCondition(conditional,id,updatecords,x,y)
 for i,v in ipairs(onComandButton) do 
  if v.gamestate == gamestate then
   if v.id == id then
    v.condition = conditional
	if v.condition == true then
	 if updatecords == true then
	  v.x = x
	  v.y = y
	 end
    end	 
   end
  end
 end  
end
function onComandButton.Draw()
 for i,v in ipairs(onComandText) do
  if v.condition == true then 
   if v.gamestate == gamestate then
    love.graphics.setFont(v.font)
    love.graphics.print(v.text,v.x,v.y)
   end
   if v.gamestate == level then
    love.graphics.setFont(v.font)
    love.graphics.print(v.text,v.x,v.y)
   end
  end 
 end
 for i,v in ipairs(onComandButton) do
  if v.condition == true then
  if v.mouseover == false then
   love.graphics.setColor(255,255,255)
  end	
  if v.mouseover == true then
   love.graphics.setColor(255,0,0)
  end
  if gamestate  == v.gamestate then 
   if v.gamestate == gamestate  then
    if v.setBackground == "yes" then
     love.graphics.setBackgroundColor(v.r,v.g,v.b)
    end 	
	if v.tipe == "pic" then  
	 love.graphics.setColor(255,255,255)
     love.graphics.draw(v.pic,v.x,v.y)
	end
	if v.tipe == "text" then
     love.graphics.setFont( v.font )
	 love.graphics.print(v.pic,v.x,v.y)
	end 
   end	
  end
  if v.gamestate == level  then
   if v.setBackground == "yes" then
    love.graphics.setBackgroundColor(v.r,v.g,v.b)
   end 	
   if v.tipe == "pic" then  
	love.graphics.setColor(255,255,255)
    love.graphics.draw(v.pic,v.x,v.y)
   end
   if v.tipe == "text" then
    love.graphics.setFont( v.font )
	love.graphics.print(v.pic,v.x,v.y)
   end 
  end	
 end
 end
end
function onComandButton.ClickText(x,y,mouse)
 if mouse == "l" then 
  for i,v in ipairs(onComandButton) do 
  if v.condition == true then
   if v.tipe == "text" then
    if v.gamestate == gamestate then
     if  x > v.x and
      x < v.x + v.font:getWidth(v.pic) and
      y > v.y and
      y < v.y + v.font:getHeight() then
       idCall(v.id)
	   love.audio.play(buttonClick1)
	   v.mouseover = false
	 end
    end	
	if v.gamestate == level then
     if  x > v.x and
      x < v.x + v.font:getWidth(v.pic) and
      y > v.y and
      y < v.y + v.font:getHeight() then
       idCall(v.id)
	   love.audio.play(buttonClick1)
	   v.mouseover = false
	 end
    end	
   end
  end
 end 
end 
end

function onComandButton.ClickPic(x,y,mouse)
 if mouse == "l" then
  for i,v in ipairs(onComandButton) do
   if v.condition == true then
   if v.tipe == "pic" then
    if v.gamestate == gamestate then
     if  x > v.x and
      x < v.x + v.pic:getWidth() and
      y > v.y and
      y < v.y + v.pic:getHeight() then
      idCall(v.id)
	  love.audio.play(buttonClick1)
     end
    end
	 if v.gamestate == level then
     if  x > v.x and
      x < v.x + v.pic:getWidth() and
      y > v.y and
      y < v.y + v.pic:getHeight() then
      idCall(v.id)
	  love.audio.play(buttonClick1)
     end
    end
   end
  end
 end 
end
end

function onComandButton.Check()
 for i,v in ipairs(onComandButton) do
  if v.condition == true then
  for ii,vv in ipairs(options) do
   if vv.gamepad == false then
    if v.tipe == "pic" then 
     if v.gamestate == gamestate then
      if  mousex > v.x and
	   mousex < v.x + v.pic:getWidth() and
	   mousey > v.y and
	   mousey < v.y + v.pic:getHeight() then
	   v.mouseover = true
      else
	   v.mouseover = false
      end
     end
	 if v.gamestate == level then
      if  mousex > v.x and
	   mousex < v.x + v.pic:getWidth() and
	   mousey > v.y and
	   mousey < v.y + v.pic:getHeight() then
	   v.mouseover = true
      else
	   v.mouseover = false
      end
     end
    elseif v.tipe == "text" then
     if v.gamestate == gamestate then
      if mousex > v.x and
       mousex < v.x + v.font:getWidth(v.pic) and
       mousey > v.y and
       mousey < v.y + v.font:getHeight() then
       v.mouseover = true
	  else
       v.mouseover = false
	  end
     end
	 if v.gamestate == level then
      if mousex > v.x and
       mousex < v.x + v.font:getWidth(v.pic) and
       mousey > v.y and
       mousey < v.y + v.font:getHeight() then
       v.mouseover = true
	  else
       v.mouseover = false
	  end
	 end 
    end
   end
  end
 end 
 end
end 



