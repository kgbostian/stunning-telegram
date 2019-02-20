function pp()
    print("Pathway is: ", pathway)
end

function prp()
    print("The way home is: ", wayHome)
end

function dig()
    --print("Dig")
end
function digDown()
    --print("Dig Down")
end
function digUp()
    --print("Dig Up")
end

function debug_control(state)
    if state == true then
        debug_state = true
    elseif state == false then
        debug_state = false
    else
        print("Failed to set debug control: ", state)
    end
end
