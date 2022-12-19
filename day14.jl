f = open("data14.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)
data = map((x) -> split(x, " -> "), data)




function rocks(tab, maps)
    prev_x = parse(Int64, split(tab[1], ",")[1])
    prev_y = parse(Int64, split(tab[1], ",")[2])
    for index in 2:length(tab)
        x = parse(Int64, split(tab[index], ",")[1])
        y = parse(Int64, split(tab[index], ",")[2])
        if x == prev_x
            for i in min(y, prev_y):max(y, prev_y)
                maps[(x, i)] = "#"
            end

        else
            for j in min(x, prev_x):max(x, prev_x)
                maps[(j, y)] = "#"
            end
        end
        prev_x = x
        prev_y = y
    end
end

function move(maps)
    prev_position = (0, 0)
    position = (500, 0)
    while position != prev_position
        prev_position = position
        position = nextStep(position, maps)
    end
    if position == (500, 0)
        return true
    else
        maps[position] = "o"
        return false
    end
end


function nextStep(position, maps)
    if position[2] == 162 #deep = 161
        return position
    end
    if !haskey(maps, (position[1], position[2] + 1))
        return (position[1], position[2] + 1)
    elseif !haskey(maps, (position[1] - 1, position[2] + 1))
        return (position[1] - 1, position[2] + 1)
    elseif !haskey(maps, (position[1] + 1, position[2] + 1))
        return (position[1] + 1, position[2] + 1)
    else
        return position
    end
end

function howMany(maps)
    counter = 0
    isFull = false
    while !isFull
        isFull = move(maps)
        counter += 1
    end
    return counter
end





maps = Dict()


map((x) -> rocks(x, maps), data)

deep = maximum(map(x -> maximum([parse(Int64, split(y, ",")[2]) for y in x]), data))

println(howMany(maps))