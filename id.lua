id = {}
local warmUp = .25
local warm = 0
local ready = false
function idCreate(ID,tipe,gamestate,funct,...)
 table.insert(id,{ID = ID, tipe = tipe, gamestate = gamestate, funct = funct, arg = ...})
end
function idCall(x)
 for i,v in ipairs(id) do
  if x == 1 then
   if ready == true then
   ready = false
   warm = 0
   love.event.push("quit")
   end	
   elseif x == v.ID then
    if ready == true then
     ready = false
     warm = 0
      if v.tipe == "gamestate"
       then gamestate = v.gamestate
      elseif v.tipe == "funct" then 
	   v.funct(v.arg) 
	end 
   end
  end
 end
end
function idWarmUp()
 if warm < warmUp then
  warm = warm + warmUp/32
  ready = false 
 else
  ready = true 
 end 
end