f = open("data2.txt")
data = read(f, String)
close(f)
data = split(data, "\n\n")
data = map((x) -> split(x, "\n"), data)
data = [parse.(Int, a) for a in data]
data = map((x) -> sum(x), data)
c = maximum(data)
println(c)


data = deleteat!(data, findfirst(x -> x == c, data))
c = maximum(data)
println(c)
data = deleteat!(data, findfirst(x -> x == c, data))
c = maximum(data)
println(c)
