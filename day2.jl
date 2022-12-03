f = open("data2.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
data = map((x) -> split(x, " "), data)
pop!(data)

formPoints = Dict("X" => 1, "Y" => 2, "Z" => 3)
dictA = Dict("X" => 3, "Y" => 6, "Z" => 0)
dictB = Dict("X" => 0, "Y" => 3, "Z" => 6)
dictC = Dict("X" => 6, "Y" => 0, "Z" => 3)
dicts = Dict("A" => dictA, "B" => dictB, "C" => dictC)

function point(tab)
    (dicts[tab[1]])[tab[2]] + formPoints[tab[2]]
end

#soluce 1:
#print(sum(point, data))

RoundPoints = Dict("X" => 0, "Y" => 3, "Z" => 6)
dictA2 = Dict("X" => 3, "Y" => 1, "Z" => 2)
dictB2 = Dict("X" => 1, "Y" => 2, "Z" => 3)
dictC2 = Dict("X" => 2, "Y" => 3, "Z" => 1)
dicts2 = Dict("A" => dictA2, "B" => dictB2, "C" => dictC2)

function point2(tab)
    (dicts2[tab[1]])[tab[2]] + RoundPoints[tab[2]]
end

print(sum(point2, data))