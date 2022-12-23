f = open("data23.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")


function parsing(data)
    dict = Dict()
    for i in 1:length(data)
        for j in 1:length(data[1])
            if data[i][j] == '#'
                dict[(j, i)] = (j, i)
            end
        end
    end
    return dict
end


function direction(dict, wish, x, y, dir)
    if dir == 0
        if !haskey(dict, (x, y - 1)) && !haskey(dict, (x - 1, y - 1)) && !haskey(dict, (x + 1, y - 1))
            dict[(x, y)] = (x, y - 1)
            if !haskey(wish, (x, y - 1))
                wish[(x, y - 1)] = 1
            else
                wish[(x, y - 1)] += 1
            end
            return true
        end
        return false
    elseif dir == 1
        if !haskey(dict, (x, y + 1)) && !haskey(dict, (x - 1, y + 1)) && !haskey(dict, (x + 1, y + 1))
            dict[(x, y)] = (x, y + 1)
            if !haskey(wish, (x, y + 1))
                wish[(x, y + 1)] = 1
            else
                wish[(x, y + 1)] += 1
            end
            return true
        end
        return false
    elseif dir == 2
        if !haskey(dict, (x - 1, y)) && !haskey(dict, (x - 1, y + 1)) && !haskey(dict, (x - 1, y - 1))
            dict[(x, y)] = (x - 1, y)
            if !haskey(wish, (x - 1, y))
                wish[(x - 1, y)] = 1
            else
                wish[(x - 1, y)] += 1
            end
            return true
        end
        return false
    elseif dir == 3
        if !haskey(dict, (x + 1, y)) && !haskey(dict, (x + 1, y + 1)) && !haskey(dict, (x + 1, y - 1))
            dict[(x, y)] = (x + 1, y)
            if !haskey(wish, (x + 1, y))
                wish[(x + 1, y)] = 1
            else
                wish[(x + 1, y)] += 1
            end
            return true
        end
        return false
    end
end

function hasNeighbor(dict, x, j)
    return haskey(dict, (x + 1, j)) || haskey(dict, (x + 1, j - 1)) || haskey(dict, (x + 1, j + 1)) || haskey(dict, (x - 1, j)) || haskey(dict, (x - 1, j - 1)) || haskey(dict, (x - 1, j + 1)) || haskey(dict, (x, j + 1)) || haskey(dict, (x, j - 1))
end


function tour(dict, order)
    wish = Dict()
    counter = 0
    for elve in dict
        if hasNeighbor(dict, elve[1][1], elve[1][2])
            bool = direction(dict, wish, elve[1][1], elve[1][2], mod(order, 4))
            if !bool
                bool = direction(dict, wish, elve[1][1], elve[1][2], mod(order + 1, 4))
                if !bool
                    bool = direction(dict, wish, elve[1][1], elve[1][2], mod(order + 2, 4))
                    if !bool
                        bool = direction(dict, wish, elve[1][1], elve[1][2], mod(order + 3, 4))
                        if !bool
                            counter += 1
                            dict[(elve[1][1], elve[1][2])] = (elve[1][1], elve[1][2])
                            wish[(elve[1][1], elve[1][2])] = 1
                        end
                    end
                end
            end
        else
            counter += 1
            dict[(elve[1][1], elve[1][2])] = (elve[1][1], elve[1][2])
            wish[(elve[1][1], elve[1][2])] = 1
        end
    end
    newdict = Dict()
    for elve in dict
        if wish[(elve[2][1], elve[2][2])] == 1
            newdict[(elve[2][1], elve[2][2])] = (elve[2][1], elve[2][2])
            delete!(dict, (elve[1][1], elve[1][2]))
        end
    end
    dict = merge!(dict, newdict)
    return [dict, counter]
end


function solution1(data)
    dict = parsing(data)
    nbElves = length(dict)
    for i in 0:9
        dict = tour(dict, mod(i, 4))[1]
    end
    x = []
    y = []
    for elve in dict
        push!(x, elve[1][1])
        push!(y, elve[1][2])
    end
    println((abs(maximum((z) -> z, x) - minimum((z) -> z, x)) + 1) * (abs(maximum((z) -> z, y) - minimum((z) -> z, y)) + 1) - nbElves)
    return dict
end

#dict = solution1(data)


function solution2(data)
    dict = parsing(data)
    nbElves = length(dict)
    index = 0
    counter = 0
    while counter != nbElves
        dict, counter = tour(dict, mod(index, 4))
        index += 1
    end
    print(index)
end

solution2(data)






