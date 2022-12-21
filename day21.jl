using SymPy

f = open("data21.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)

function parsing(data)
    dict = Dict()
    for line in data
        splitedLine = split(line, ": ")
        if splitedLine[2][1] in '0':'9'
            dict[splitedLine[1]] = parse(Int64, splitedLine[2])
        else
            dict[splitedLine[1]] = split(splitedLine[2], " ")
        end
    end
    return dict
end



function compute(dict, first)
    if typeof(dict[first]) == Int64 || typeof(dict[first]) == Sym
        return dict[first]
    else
        if dict[first][2] == "+"
            return compute(dict, dict[first][1]) + compute(dict, dict[first][3])
        elseif dict[first][2] == "-"
            return compute(dict, dict[first][1]) - compute(dict, dict[first][3])
        elseif dict[first][2] == "*"
            return compute(dict, dict[first][1]) * compute(dict, dict[first][3])
        elseif dict[first][2] == "/"
            return compute(dict, dict[first][1]) / compute(dict, dict[first][3])
        elseif dict[first][2] == "="
            return solveset(compute(dict, dict[first][1]) - compute(dict, dict[first][3]), x)
        end
    end
end



dict = parsing(data)
dict["root"] = [dict["root"][1], "=", dict["root"][3]]
@syms x
dict["humn"] = x

println(compute(dict, "root"))
