f = open("data5.txt")
lines = []
for i in 1:8
    push!(lines, readline(f))
end
readline(f)
commands = read(f, String)
close(f)

commands = split(commands, "\r\nmove ")
commands[end] = split(commands[end], "\r\n")[1]


function pretty(str)
    line = []
    counter = 2
    while counter <= 34
        push!(line, str[counter])
        counter += 4
    end
    return line
end

stacks = map((x) -> pretty(x), lines)

columns = []
for i in 1:9
    column = []
    j = 8
    while j > 0 && stacks[j][i] != ' '
        push!(column, stacks[j][i])
        j = j - 1
    end
    push!(columns, column)
end

commands = map((command) -> split(command, " from "), commands)

function execute(command, columns)
    number = parse(Int64, command[1])
    from = parse(Int64, command[2][1])
    to = parse(Int64, command[2][end])
    for i in 1:number
        push!(columns[to], columns[from][end])
        pop!(columns[from])
    end
end

#solution 1
#map((command) -> execute(command, columns), commands[2:end])
#map((column) -> print(column[end]), columns)


function execute2(command, columns)
    number = parse(Int64, command[1])
    from = parse(Int64, command[2][1])
    to = parse(Int64, command[2][end])
    stack = []
    for i in 1:number
        push!(stack, columns[from][end])
        pop!(columns[from])
    end
    for i in 1:number
        push!(columns[to], stack[end])
        pop!(stack)
    end
end

map((command) -> execute2(command, columns), commands[2:end])
map((column) -> print(column[end]), columns)

