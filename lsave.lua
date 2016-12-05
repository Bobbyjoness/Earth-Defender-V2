save = {}
local as = 1
function save.Create(t,filename) -- t = table to be saved and filename is the name of the file when it is saved 
 if not love.filesystem.exists( filename..'.txt' ) then    
  filedname = love.filesystem.newFile(filename..'.txt')
  filedname:open("w")
  filedname:write( TSerial.pack( t ) )
  filedname:close()
  print'saved'
 else
   print'false'
  return false 
 end 
end
function save.Overwrite(t,filename)
 love.filesystem.write(filename..'.txt',TSerial.pack( t ))
end
function save.Remove(filename)
 love.filesystem.remove(filename..'.txt')
end
function save.Auto(t,filename,interval)
 if Tick/interval > as then
  save.Overwrite(t,filename)
  as = as + 1
  print'saving'
 end 
end
function save.Load(filename) 
 if love.filesystem.exists( filename..'.txt' ) then
  filedname = love.filesystem.newFile( filename..'.txt' )
  filedname:open("r")
  return TSerial.unpack( filedname:read(all))
 end 
 if not love.filesystem.exists(filename..'.txt') then
  print('none'..filename)
  return false  
 end 
 filedname:close()
end
function save.LogCreate()
 save.Create(logs,'Logs')  
end
function save.LogEnter(entry)
 table.insert(logs, {logs = entry})
 print(entry)
 print(Tserial.pack(logs))
 save.Overwrite(logs,'Logs')
 
end
function save.LogGet()
 return save.Load('Logs')
end