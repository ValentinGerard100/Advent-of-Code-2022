f = open("data22.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n\r\n")
points = data[1]
commands = data[2]

points = split(points, "\r\n")

function parsing(points)
    dict = Dict()
    raw = 1
    for line in points
        col = 1
        for letter in line
            if letter != ' '
                dict[(col, raw)] = letter
            end
            col += 1
        end
        raw += 1
    end
    return dict
end

function commandList(commands)
    str = commands
    list = []
    index = 1
    did = false
    while !did
        if str[index] == 'L'
            push!(list, parse(Int64, str[1:index-1]))
            push!(list, 'L')
            str = str[index+1:end]
            index = 1
        elseif str[index] == 'R'
            push!(list, parse(Int64, str[1:index-1]))
            push!(list, 'R')
            str = str[index+1:end]
            index = 1
        elseif index == length(str)
            push!(list, parse(Int64, str))
            did = true
        else
            index += 1
        end
    end
    return list
end

function borders(dict)
    frontiers = Dict()
    for coord ∈ keys(dict)
        if (coord[1] - 1, coord[2]) ∉ keys(dict)
            frontiers[(coord[1] - 1, coord[2])] = 'o'
        end
        if (coord[1] + 1, coord[2]) ∉ keys(dict)
            frontiers[(coord[1] + 1, coord[2])] = 'o'
        end
        if (coord[1], coord[2] - 1) ∉ keys(dict)
            frontiers[(coord[1], coord[2] - 1)] = 'o'
        end
        if (coord[1], coord[2] + 1) ∉ keys(dict)
            frontiers[(coord[1], coord[2] + 1)] = 'o'
        end
    end
    return merge!(dict, frontiers)
end




mutable struct Position
    x
    y
    dir
end

position = Position(51, 1, 1)

function move(dict)
    if position.dir == 1
        nextX = position.x + 1
        nextY = position.y
    elseif position.dir == 2
        nextX = position.x
        nextY = position.y + 1
    elseif position.dir == 3
        nextX = position.x - 1
        nextY = position.y
    else
        nextX = position.x
        nextY = position.y - 1
    end
    if dict[(nextX, nextY)] == '.'
        position.x = nextX
        position.y = nextY
    elseif dict[(nextX, nextY)] == 'o'
        if position.dir == 3
            nextX = position.x + 1
            while dict[(nextX + 1, nextY)] != 'o'
                nextX += 1
            end
        elseif position.dir == 0
            nextY = position.y + 1
            while dict[(nextX, nextY + 1)] != 'o'
                nextY += 1
            end
        elseif position.dir == 1
            nextX = position.x - 1
            while dict[(nextX - 1, nextY)] != 'o'
                nextX += -1
            end
        else
            nextY = position.y - 1
            while dict[(nextX, nextY - 1)] != 'o'
                nextY += -1
            end
        end
        if dict[(nextX, nextY)] != '#'
            position.x = nextX
            position.y = nextY
        end
    end
end


function turn(command)
    if command == 'R'
        position.dir = mod(position.dir + 1, 4)
    else
        position.dir = mod(position.dir - 1, 4)
    end
end


dict = borders(parsing(points))


function solution1(dict, commands)
    for command in commands
        if typeof(command) != Int64
            turn(command)
        else
            for i in 1:command
                move(dict)
            end
        end
    end
    println(position.x * 4 + 1000 * position.y + mod(position.dir - 1, 4))
end

#solution1(dict, commandList(commands))

####part 2

cube = Dict()
for i in 1:50
    cube[(100 + i, 51, 2)] = (100, 50 + i, 3) #2->3
    cube[(101, 50 + i, 1)] = (100 + i, 50, 0) #3->2
    cube[(151, 0 + i, 1)] = (100, 151 - i, 3)# 2->4
    cube[(101, 100 + i, 1)] = (150, 51 - i, 3)# 4->2
    cube[(50 + i, 151, 2)] = (50, 150 + i, 3)# 4->6
    cube[(51, 150 + i, 1)] = (50 + i, 150, 0)# 6->4
    cube[(0 + i, 201, 2)] = (100 + i, 1, 2)# 6->2
    cube[(100 + i, 0, 0)] = (0 + i, 200, 0)# 2->6
    cube[(0, 150 + i, 3)] = (50 + i, 1, 2)# 6->1
    cube[(50 + i, 0, 0)] = (1, 150 + i, 1)# 1->6
    cube[(50, 0 + i, 3)] = (1, 151 - i, 1)# 1->5
    cube[(0, 100 + i, 3)] = (51, 51 - i, 1)# 5->1
    cube[(50, 50 + i, 3)] = (0 + i, 101, 2)# 3->5
    cube[(0 + i, 100, 0)] = (51, 50 + i, 1)# 5->3
end


function move2(dict, cube)
    if position.dir == 1
        nextX = position.x + 1
        nextY = position.y
    elseif position.dir == 2
        nextX = position.x
        nextY = position.y + 1
    elseif position.dir == 3
        nextX = position.x - 1
        nextY = position.y
    else
        nextX = position.x
        nextY = position.y - 1
    end
    if dict[(nextX, nextY)] == '.'
        position.x = nextX
        position.y = nextY
    elseif dict[(nextX, nextY)] == 'o'
        next = cube[(nextX, nextY, position.dir)]
        nextX = next[1]
        nextY = next[2]
        nextDir = next[3]
        if dict[(nextX, nextY)] == '.'
            position.x = nextX
            position.y = nextY
            position.dir = nextDir
        end
    end
end



function solution2(dict, commands, cube)
    for command in commands
        if typeof(command) != Int64
            turn(command)
        else
            for i in 1:command
                move2(dict, cube)
            end
        end
    end
    println(position.x * 4 + 1000 * position.y + mod(position.dir - 1, 4))
end

solution2(dict, commandList(commands), cube)
