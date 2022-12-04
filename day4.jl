f = open("data4.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)
data = map((x) -> split(x, ","), data)

function isFullyContain(tab)
    tab = map((x) -> split(x, '-'), tab)
    tab = map((x) -> parse(Int64, x[1]):parse(Int64, x[2]), tab)
    issubset(tab[1], tab[2]) || issubset(tab[2], tab[1])
end

data1 = filter(isFullyContain, data)
#Solution 1
#print(length(data1))

function isOverlap(tab)
    tab = map((x) -> split(x, '-'), tab)
    tab = map((x) -> parse(Int64, x[1]):parse(Int64, x[2]), tab)
    length(intersect(tab[1], tab[2])) != 0
end

data2 = filter(isOverlap, data)
print(length(data2))
