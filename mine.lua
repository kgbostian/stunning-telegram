require("debug")
require("pathAccounting")


MineControl = {}

function MineControl:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
-------------------- Mining Work -------------------------
function MineControl.digWalkway()
    dig()
    moveForward()
    digUp()
    digDown()
end

function MineControl.backUp(distance)
    for a=1,distance,1 do
        moveBackward()
    end
end

function MineControl.digProspectWindow(dist)
    for a=1,dist,1 do
        dig()
        moveForward()
    end
end

function MineControl.prospect(dir)
    turn(dir)
    dig()
end    

function MineControl.strip_hall_section(dist)
    for a=1,dist,1 do
        MineControl.digWalkway()
    end
end

function MineControl.turn_and_strip(dir, dist)
    turn(dir)
    MineControl.strip_hall_section(dist)
end

function MineControl.cut_square(size, dir)
    MineControl.strip_hall_section(size)
    MineControl.turn_and_strip(dir, size)
    MineControl.turn_and_strip(dir, size)
    MineControl.turn_and_strip(dir, size)
end

function MineControl.cut_strip_mine(strip, starting_dir, size_of_mine)
    local pos = 1
    local dir = starting_dir
    pos = move_fwd_to_pos(strip,dir,pos)
    --print("pos = ", pos)
    while(pos < size_of_mine) do
        MineControl.strip_hall_section(size_of_mine)
        --print("Looping change dir, ", dir)
        dir = reverseStep(dir)
        turn(dir)
        pos = move_fwd_to_pos(strip,dir,pos)
        --print("pos: ", pos)
    end
end


function MineControl.stripMine()
    cont = true
    local dir = 'R'
    local size = 15
    while(cont) do
        MineControl.cut_square(size,dir)
        MineControl.cut_strip_mine(3,dir, size)

        cont = false
    end
    reversePath()
end

------------------ End Mining Work -----------------------

