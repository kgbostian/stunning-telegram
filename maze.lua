maze = {}
unvisited = 'X'
visited = ' '
turtle = '*'
cardinal_directions = {'N','E','S','W'}
current_direction = 1


function reset_maze()
    maze = {}
    for i=0,maze_x_size,1 do
        maze[i]={}
        for j=0,maze_y_size,1 do
            maze[i][j] = unvisited
        end
    end
end

function print_maze()
    for i=maze_x_size,1,-1 do
        row = ''
        for j=maze_y_size,1,-1 do
            row = row .. maze[i][j]
        end
        print(row)
    end
end

function update_current_marker()
    print("Updating current location: ", crt_xpos, crt_ypos)
    maze[crt_xpos][crt_ypos] = turtle
end

function set_position(xpos, ypos)
    crt_xpos = xpos
    crt_ypos = ypos
    update_current_marker()
end

function update_visited_marker()
    print("Updating visited location: ", crt_xpos, crt_ypos)
    maze[crt_xpos][crt_ypos] = visited
end

function change_cardinal(action)
    current_direction = current_direction + 4
    if(action == 'R') then
        current_direction = current_direction + 1
    elseif(action == 'L') then
        current_direction = current_direction - 1
    end
    current_direction = current_direction % 4
end

function get_cardinal_direction()
    return cardinal_directions[current_direction]
end

function update_position(action)
    print("Updating position: ", action)
    update_visited_marker()
    if(action == 'R' or action == 'L') then
        print("Maze is turning: ", action)
        change_cardinal(action)
    elseif(action == 'F') then
        cd = get_cardinal_direction()
        print("Moving forward in: ", cd)
        if(cd == 'N') then
            crt_xpos = crt_xpos + 1
        elseif(cd == 'S') then
            crt_xpos = crt_xpos - 1
        elseif (cd == 'E') then
            crt_ypos = crt_ypos - 1
        elseif (cd == 'W') then
            crt_ypos = crt_ypos + 1
        end
    elseif(action == 'B') then
        cd = get_cardinal_direction()
        print("Moving backward in: ", cd)
        if(cd == 'N') then
            crt_xpos = crt_xpos - 1
        elseif(cd == 'S') then
            crt_xpos = crt_xpos + 1
        elseif (cd == 'E') then
            crt_ypos = crt_ypos + 1
        elseif (cd == 'W') then
            crt_ypos = crt_ypos - 1
        end
    end
    update_current_marker()
end

function parse_movement(string_of_movement)
    for i=1,string.len(pathway),1 do
        mvt = string.sub(pathway,-i,-i)
        update_position(mvt)
        print("Parsing movement: ", mvt)
    end
end

maze_y_size = 80
maze_x_size = 80


x_pos = 40
y_pos = 40

reset_maze()
set_position(x_pos,y_pos)
