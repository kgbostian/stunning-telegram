require("debug")
require("pathAccounting")

-------------------- Mining Work -------------------------
function digWalkway()
    digUp()
    digDown()
    dig()
end

function turn(dir)
    if dir  == 'R' then
	turnRight()
    elseif dir == 'L' then
        turnLeft()
    else
        print("Failed to turn in dir: ", dir)
    end
end

function backUp(distance)
    for a=1,distance,1 do
        moveBackward()
    end
end

function digProspectWindow(dist)
    for a=1,dist,1 do
        dig()
        moveForward()
    end
    backUp(dist)
end

function prospect(dir)
    turn(dir)
    dig()
end    

function stripMine()
    while(true) do
        digWalkway()
        moveForward()
        digWalkway()
	moveForward()
	digWalkway()
	moveForward()
    end
end

------------------ End Mining Work -----------------------

