f = open("data15.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)

function parsing(line)
    s, b = split(line, ": ")
    s = split(s, "at x=")[2]
    b = split(b, "at x=")[2]
    s = map((x) -> parse(Int64, x), split(s, ", y="))
    b = map((x) -> parse(Int64, x), split(b, ", y="))
    return [s, b]
end

function distance(tab)
    return abs(tab[1][1] - tab[2][1]) + abs(tab[1][2] - tab[2][2])
end



function solution1(data)
    notPossible = Set()
    for tab in data
        d = distance(tab)
        if abs(2000000 - tab[1][2]) <= d
            for i in 0:d-abs(2000000 - tab[1][2])
                push!(notPossible, [2000000, tab[1][1] + i])
                push!(notPossible, [2000000, tab[1][1] - i])
            end
        end
    end
    alreadyBeacon = Set()
    for tab in data
        if tab[2][2] == 2000000
            push!(alreadyBeacon, [tab[2][1], tab[2][2]])
        end
    end
    return length(notPossible) - length(alreadyBeacon)
end

data = map((x) -> parsing(x), data)

function frontiers(data)
    positives = []
    negatives = []
    for tab in data
        d = distance(tab)
        push!(positives, tab[1][2] - tab[1][1] + d)
        push!(positives, tab[1][2] - tab[1][1] - d)
        push!(negatives, tab[1][2] + tab[1][1] + d)
        push!(negatives, tab[1][2] + tab[1][1] - d)
    end
    return [positives, negatives]
end

function whichOnes(tab)
    for frontier1 in tab
        for frontier2 in tab
            if abs(frontier1 - frontier2) == 2
                return min(frontier1, frontier2) + 1
            end
        end
    end
end

function solution2(tab)
    positive = whichOnes(tab[1])
    negative = whichOnes(tab[2])
    return Int64((negative - positive) / 2) * 4000000 + Int64((positive + negative) / 2)
end

println(solution2(frontiers(data)))