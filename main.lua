require("mine")
require("debugCode")
require("maze")

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

parse_movement(pathway)
print_maze()


--print("Reseting Pathways.")
--resetPathways()

-- Debug controls -- 
debug_control(true)

-- Testing Mining function -- 

print("Starting Mining Functions.")
mc = MineControl:new()
--mc.digProspectWindow(8)
--mc.stripMine()
mc.cut_square(16,'R')

pp();
prp();

parse_movement(pathway)
print_maze()
