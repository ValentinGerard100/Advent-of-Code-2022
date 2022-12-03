f = open("data3.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)
data = map((x) -> split(x, " "), data)
data = map((x) -> split(x[1], ""), data)


function priority()
    priority = Dict{Char,Int64}()
    counter = 1
    for letter in 'a':'z'
        merge!(priority, Dict(letter => counter))
        counter += 1
    end
    for letter in 'A':'Z'
        merge!(priority, Dict(letter => counter))
        counter += 1
    end
    return priority
end

function intruder(tab, priority)
    lenTab = Int(length(tab) / 2)
    callList = zeros(Int64, priority['Z'])
    for letter in tab[1:lenTab]
        callList[priority[only(letter)]] = 1
    end
    for letter in tab[lenTab+1:end]
        if callList[priority[only(letter)]] == 1
            return priority[only(letter)]
        end
    end
end

#solution part 1
#print(sum(tab -> intruder(tab, priority()), data))


function badge(tab, priority)
    callList1 = zeros(Int64, priority['Z'])
    callList2 = zeros(Int64, priority['Z'])
    callList3 = zeros(Int64, priority['Z'])
    for letter in tab[1]
        callList1[priority[only(letter)]] = 1
    end
    for letter in tab[2]
        callList2[priority[only(letter)]] = 1
    end
    for letter in tab[3]
        callList3[priority[only(letter)]] = 1
    end
    callList = callList1 + callList2 + callList3
    return findall(x -> x == 3, callList)[1]
end

fun = tab -> badge(tab, priority())
function sol2(tab)
    sum = 0
    for i = 1:Int(length(tab) / 3)
        sum += fun([tab[3*(i-1)+1], tab[3*(i-1)+2], tab[3*i]])
    end
    return sum
end

print(sol2(data))