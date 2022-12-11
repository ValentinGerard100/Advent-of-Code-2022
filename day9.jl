f = open("data9.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)
data = map((x) -> split(x, " "), data)


mutable struct Head
    positionH
    previousH
    positionT
    visitedT
end

function move(command)
    if command[1] == "U"
        moveUp(parse(Int64, command[2]))
    end
    if command[1] == "D"
        moveDown(parse(Int64, command[2]))
    end
    if command[1] == "R"
        moveRight(parse(Int64, command[2]))
    end
    if command[1] == "L"
        moveLeft(parse(Int64, command[2]))
    end
end

function moveUp(number)
    for i in 1:number
        head.previousH[1] = head.positionH[1]
        head.previousH[2] = head.positionH[2]
        head.positionH[1] += 1
        follow()
    end

end

function moveDown(number)
    for i in 1:number
        head.previousH[1] = head.positionH[1]
        head.previousH[2] = head.positionH[2]
        head.positionH[1] += -1
        follow()
    end
end

function moveRight(number)
    for i in 1:number
        head.previousH[1] = head.positionH[1]
        head.previousH[2] = head.positionH[2]
        head.positionH[2] += 1
        follow()
    end
end

function moveLeft(number)
    for i in 1:number
        head.previousH[1] = head.positionH[1]
        head.previousH[2] = head.positionH[2]
        head.positionH[2] += -1
        follow()
    end
end

function follow()
    i = head.positionT[1]
    j = head.positionT[2]
    k = head.positionH[1]
    l = head.positionH[2]
    if !([k, l] in [[i, j], [i, j + 1], [i, j - 1], [i + 1, j], [i + 1, j + 1], [i + 1, j - 1], [i - 1, j], [i - 1, j + 1], [i - 1, j - 1]])
        head.positionT[1] = head.previousH[1]
        head.positionT[2] = head.previousH[2]
        push!(head.visitedT, [head.positionT[1], head.positionT[2]])
    end
    #println(head.positionH, head.previousH, head.positionT, head.visitedT)
end
head = Head([0, 0], [0, 0], [0, 0], Set())
push!(head.visitedT, [0, 0])


map((x) -> move(x), data)

print(length(head.visitedT))
