f = open("data6.txt")
data = read(f, String)
close(f)

function indexMarker(data)
    index = 1
    window = data[1:4]
    while index < length(data) - 4 && length(Set(window)) != 4
        index += 1
        window = data[index:index+3]
    end
    index += 3
end
#solution1
#print(indexMarker(data))

function indexMarker2(data)
    index = 1
    window = data[1:14]
    while index < length(data) - 14 && length(Set(window)) != 14
        index += 1
        window = data[index:index+13]
    end
    index += 13
end

print(indexMarker2(data))