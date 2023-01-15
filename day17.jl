
f = open("data17.txt")
data = split(read(f, String), "\r\n")[1]
close(f)


mutable struct chamber
    cave
    top
    counter
    commands
end

c = chamber(Dict(), 0, 0, data)
for i in 1:7
    c.cave[[i, 0]] = 1
    c.cave[[0, i]] = 0
    c.cave[[8, i]] = 0
end

function createShape()
    if mod(c.counter, 5) == 0
        return [[3, c.top + 4], [4, c.top + 4], [5, c.top + 4], [6, c.top + 4]]
    elseif mod(c.counter, 5) == 1
        return [[4, c.top + 4], [3, c.top + 5], [4, c.top + 5], [5, c.top + 5], [4, c.top + 6]]
    elseif mod(c.counter, 5) == 2
        return [[3, c.top + 4], [4, c.top + 4], [5, c.top + 4], [5, c.top + 5], [5, c.top + 6]]
    elseif mod(c.counter, 5) == 3
        return [[3, c.top + 4], [3, c.top + 5], [3, c.top + 6], [3, c.top + 7]]
    elseif mod(c.counter, 5) == 4
        return [[3, c.top + 4], [3, c.top + 5], [4, c.top + 4], [4, c.top + 5]]
    end
end

function blockDown(shape)
    for case in shape
        if haskey(c.cave, [case[1], case[2] - 1])
            return true
        end
    end
    return false
end

function blockRight(shape)
    for case in shape
        if haskey(c.cave, [case[1] + 1, case[2]])
            return true
        end
    end
    return false
end

function blockLeft(shape)
    for case in shape
        if haskey(c.cave, [case[1] - 1, case[2]])
            return true
        end
    end
    return false
end

function tetris(nbTour)
    len = length(data)
    index = 0
    while c.counter < nbTour
        previous = []
        shape = createShape()
        for i in 1:4
            c.cave[[0, c.top + i]] = 0
            c.cave[[8, c.top + i]] = 0
        end
        while shape != previous
            if c.commands[mod(index, len)+1] == '<' && !blockLeft(shape)
                shape = map((case) -> [case[1] - 1, case[2]], shape)
            elseif c.commands[mod(index, len)+1] == '>' && !blockRight(shape)
                shape = map((case) -> [case[1] + 1, case[2]], shape)
            end
            index += 1
            previous = shape
            if !blockDown(shape)
                shape = map((case) -> [case[1], case[2] - 1], shape)
            end
        end
        c.top = max(maximum([case[2] for case in shape]), c.top)
        for case in shape
            c.cave[case] = 1
        end
        c.counter += 1
    end
    return c.top
end
#solution1
#println(tetris(2022))




function findPeriod()
    len = length(data)
    index = 0
    tops = [0, 0, 0, 0, 0, 0, 0]
    sol = []
    while length(sol) < 2
        previous = []
        shape = createShape()
        for i in 1:4
            c.cave[[0, c.top + i]] = 0
            c.cave[[8, c.top + i]] = 0
        end
        while shape != previous
            if c.commands[mod(index, len)+1] == '<' && !blockLeft(shape)
                shape = map((case) -> [case[1] - 1, case[2]], shape)
            elseif c.commands[mod(index, len)+1] == '>' && !blockRight(shape)
                shape = map((case) -> [case[1] + 1, case[2]], shape)
            end
            index += 1
            previous = shape
            if !blockDown(shape)
                shape = map((case) -> [case[1], case[2] - 1], shape)
            end
        end
        c.top = max(maximum([case[2] for case in shape]), c.top)
        for case in shape
            c.cave[case] = 1
            if case[2] > tops[case[1]]
                tops[case[1]] = case[2]
            end
        end
        c.counter += 1
        if mod(index, len) == 0 & mod(c.counter, 5) == 0
            push!(sol, c.counter)
        end

    end
    return sol
end

offset = tetris(1748)
offset2 = tetris(3473)
hightPeriod = offset2 - offset

nbPeriod = div(1000000000000 - 1747, 3473 - 1748 + 1)
nbRest = mod(1000000000000 - 1747, 3473 - 1748 + 1)
rest = tetris(3473 + nbRest) - offset2
print(offset + nbPeriod * hightPeriod + rest)
