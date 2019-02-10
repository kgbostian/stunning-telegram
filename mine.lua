require("debug")
require("pathAccounting")

-------------------- Mining Work -------------------------
function digWalkway()
    dig()
    moveForward()
    digUp()
    digDown()
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
end

function prospect(dir)
    turn(dir)
    dig()
end    

function strip_hall_section(dist)
    for a=1,dist,1 do
        digWalkway()
    end
end

function turn_and_strip(dir, dist)
    turn(dir)
    strip_hall_section(dist)
end

function cut_square(size, dir)
    strip_hall_section(size)
    turn_and_strip(dir, size)
    turn_and_strip(dir, size)
    turn_and_strip(dir, size)
end

function move_fwd_to_pos(dist,dir,pos)
    for a=1,dist,1 do
        moveForward()
    end
    turn(dir)
    pos = pos + dist
    print("After move: ", pos)
    return pos
end


function cut_strip_mine(strip, starting_dir, size_of_mine)
    local pos = 1
    pos = move_fwd_to_pos(strip,starting_dir,pos)
    print("pos = ", pos)
    while(pos < size_of_mine) do
        strip_hall_section(size_of_mine)
        dir = reverseStep(dir)
        turn(dir)
        pos = move_fwd_to_pos(strip,dir,pos)
        print("pos: ", pos)
    end
end


function stripMine()
    cont = true
    local dir = 'R'
    local size = 15
    while(cont) do
        cut_square(size,dir)
        cut_strip_mine(3,dir, size)

        cont = false
    end
    reversePath()
end

------------------ End Mining Work -----------------------

