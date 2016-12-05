gamepad = {}
function gamepad.Connected()
 Joystick = love.joystick.getJoysticks( )
 return Joystick:isConnected( )
end
function gamepad.Options()
 if gamepad.Connected() == true then
  pauseB = true
  update = false
  onComandButton.UpdateCondition(pauseB,5)
 end 
end 