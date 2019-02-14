require("mine")
require("debugCode")

direction = 0
turnRight()
turnLeft()
moveForward()
turnRight()
turnRight()
turnLeft()
turnLeft()
turnLeft()
moveForward()
reversePath()
pp();
prp();



--print("Reseting Pathways.")
--resetPathways()

-- Debug controls -- 
debug_control(true)

-- Testing Mining function -- 

print("Starting Mining Functions.")
mc = MineControl:new()
mc.digProspectWindow(8)
mc.stripMine()

pp();
prp();


