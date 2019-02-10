----------------- Pathfinding ---------------------
-- Add action to Path list --
function updatePath(action)
    pathway = pathway .. action
    print("Pathway = :", pathway);
end


-- Reverse action step -- 
function reverseStep(c)
    local newC = ''
    if c == 'R' then
        newC =  'L'
    elseif c == 'L' then
        newC = 'R'
    elseif c == 'F' then
        newC = 'B'
    elseif c == 'B' then
        newC = 'F'
    else
        print("Error reversing step: ", newC)
    end
    return newC
end

-- Reverse Action Path -- 
function reversePath()
    reverse = string.reverse(pathway)
    for c in string.gmatch(reverse, '.') do
	wayHome = wayHome .. reverseStep(c)
    end
end


function turnRight()
    --turtle.turnRight()
    updateDirection('R')
end


function turnLeft()
    --turtle.turnLeft()
    updateDirection('L')
end


function moveForward()
    --turtle.forward()
    updatePath('F')
end


function moveBackward()
    --turtle.backward()
    updatePath('B')
end


function updateDirection(turn)
    direction = direction + 4
    if turn == 'R' then
        direction = direction + 1
	updatePath(turn)
    elseif turn == 'L' then
        direction = direction - 1
	updatePath(turn)
    else
        print("Error: Bad direction")
    end
    direction = direction % 4
end

----------------- End pathfinding ------------------------


