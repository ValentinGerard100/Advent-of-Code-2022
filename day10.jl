f = open("data10.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)
data = map((x) -> split(x, " "), data)


mutable struct CPU
    cycle
    position
    crt
end

function execute(command)
    if command[1] == "noop"
        pixel()
        push!(cpu.cycle, cpu.cycle[end])
    else
        pixel()
        push!(cpu.cycle, cpu.cycle[end])
        pixel()
        push!(cpu.cycle, cpu.cycle[end] + parse(Int64, command[2]))
    end
end

function pixel()
    if cpu.position == 40
        cpu.position = 0
    end
    if cpu.position in cpu.cycle[end]-1:cpu.cycle[end]+1
        cpu.crt = cpu.crt * "#"
    else
        cpu.crt = cpu.crt * "."
    end
    cpu.position += 1
end


cpu = CPU([1], 0, "#")

map((x) -> execute(x), data)

function sumSignalStrength(cpu)
    index = 20
    sum = 0
    while index <= 220
        sum += index * cpu.cycle[index]
        index += 40
    end
    return sum
end

#solution1
println(sumSignalStrength(cpu))

#solution2
for i in 0:5
    println(cpu.crt[1+i*40:(i+1)*40])
end
