f = open("data13.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n\r\n")
data = map((x) -> split(x, "\r\n"), data)
pop!(data[end])
stack = [[]]

function parsing(str)
    if length(str) == 1
        result = pop!(stack)
        push!(stack, [])
        return result
    else
        if str[1] == '['
            push!(stack, [])
            parsing(str[2:end])
        elseif str[1] == ']'
            push!(stack[end-1], stack[end])
            pop!(stack)
            parsing(str[2:end])
        elseif str[1] == ','
            parsing(str[2:end])
        else
            if str[2] == '0'
                push!(stack[end], parse(Int64, str[1:2]))
                parsing(str[3:end])
            else
                push!(stack[end], parse(Int64, str[1]))
                parsing(str[2:end])
            end
        end
    end
end

data = map((x) -> [parsing(x[1][2:end]), parsing(x[2][2:end])], data)

function newData(data)
    data2 = []
    for index in 1:length(data)
        push!(data2, data[index][1])

        push!(data2, data[index][2])
    end
    push!(data2, Any[Any[2]])
    push!(data2, Any[Any[6]])
    return data2
end

data2 = newData(data)
function compareLR(left, rigth)
    if typeof(left) == Int64 && typeof(rigth) != Int64
        left = [left]
    end
    if typeof(rigth) == Int64 && typeof(left) != Int64
        rigth = [rigth]
    end
    if typeof(left) == Int64
        if left < rigth
            return 1
        elseif left > rigth
            return -1
        else
            return 0
        end
    else
        index = 1
        while index <= length(left) && index <= length(rigth)
            result = compareLR(left[index], rigth[index])
            if result != 0
                return result
            end
            index += 1
        end
        if index == length(left) + 1
            if index == length(rigth) + 1
                return 0
            else
                return 1
            end
        else
            return -1
        end
    end
end

function sumCorrect(data)
    sum = 0
    for i in 1:length(data)
        if compareLR(data[i][1], data[i][2]) == 1
            sum += i
        end
    end
    return sum
end

#sol 1
#println(sumCorrect(data))

function mySort(tab)
    for i in 2:length(tab)
        x = tab[i]
        j = i
        while j > 1 && compareLR(x, tab[j-1]) == 1
            tab[j] = tab[j-1]
            j = j - 1
        end
        tab[j] = x
    end
    return tab
end

data2 = mySort(data2)
print(findfirst(x -> x == [[2]], data2) * findfirst(x -> x == [[6]], data2))