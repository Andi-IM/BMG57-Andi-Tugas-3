local Platform3Moving = {}

local part = nil

local maxPosition = Vector3.new(2.329,1.507,027.035)

local minPosition = Vector3.new(2.329,1.507,47.035)

local initialPosition = Vector3.new(2.329,1.507,37.035)

local speed = 0.05

local nextPosition = nil

local intervalVector = nil

local timer = nil


local function Move()
  local distance = Vector3.Distance(part.WorldPosition, nextPosition)
  
  if distance < 0.5 then
    local isMinPosition = nextPosition == minPosition
    nextPosition = isMinPosition and maxPosition or minPosition
    local direction = nextPosition - part.WorldPosition
    intervalVector = direction.Normalized * speed
  else
    part.WorldPosition = part.WorldPosition + intervalVector
    
    timer.Delay = 1
  end
  
end

function Platform3Moving:Start(map)
   part = map.Root:FindFirstChild("Platform3",true)
   
   part.WorldPosition = initialPosition
   
   nextPosition = minPosition
   local direction = nextPosition - part.WorldPosition
   intervalVector = direction.Normalized * speed
   
   timer = Timer.new(1, Move)
   timer.Loop = true
   timer:Start()
   
end

return Platform3Moving