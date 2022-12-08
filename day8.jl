f = open("data8.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)


function column(array, index)
    result = join([array[i][index] for i in 1:length(array)])
    return result
end
#to compute sol1
#memory = zeros(Int64, length(data) - 2, length(data[1]) - 2)

function visibiltyLines(str, index)
    rev = reverse(str)
    max = parse(Int8, str[1])
    maxr = parse(Int8, rev[1])
    len = length(str)
    for i in 2:len-1
        if parse(Int8, str[i]) > max
            max = parse(Int8, str[i])
            memory[index-1, i-1] = 1
        end
        if parse(Int8, rev[i]) > maxr
            maxr = parse(Int8, rev[i])
            memory[index-1, len-i] = 1
        end
    end
end

function visibilityColumn(str, index)
    rev = reverse(str)
    max = parse(Int8, str[1])
    maxr = parse(Int8, rev[1])
    len = length(str)
    for i in 2:len-1
        if parse(Int8, str[i]) > max
            max = parse(Int8, str[i])
            memory[i-1, index-1] = 1
        end
        if parse(Int8, rev[i]) > maxr
            maxr = parse(Int8, rev[i])
            memory[len-i, index-1] = 1
        end
    end
end

#to compute sol1
#for i in 2:length(data)-1
#visibiltyLines(data[i], i)
#end
#for i in 2:length(data[1])-1
#visibilityColumn(column(data, i), i)
#end
#println(length(data) * 2 + length(data[1]) * 2 - 4 + sum(memory))

function right(array, i, j)
    return array[i][j+1:end]
end

function left(array, i, j)
    return reverse(array[i][1:j-1])
end

function down(array, i, j)
    return [array[k][j] for k in i+1:length(array[1])]
end

function up(array, i, j)
    return reverse([array[k][j] for k in 1:i-1])
end

function countTree(array, int)
    int = parse(Int64, int)
    if length(array) == 0
        return 0
    end
    counter = 1
    while counter < length(array) && parse(Int64, array[counter]) < int
        counter += 1
    end
    return counter
end

function score(data, i, j)
    return countTree(up(data, i, j), data[i][j]) * countTree(down(data, i, j), data[i][j]) * countTree(right(data, i, j), data[i][j]) * countTree(left(data, i, j), data[i][j])
end

mat = zeros(Int64, length(data), length(data[1]))
for i in 1:length(data)
    for j in 1:length(data[1])
        mat[i, j] = score(data, i, j)
    end
end
print(maximum(mat))
