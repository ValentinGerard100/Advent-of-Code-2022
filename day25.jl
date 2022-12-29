f = open("data25.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)

function toDecimal(str)
    n = length(str) - 1
    decimal = 0
    for char in str
        if char == '1'
            decimal += 5^n
        elseif char == '2'
            decimal += (5^n) * 2
        elseif char == '='
            decimal += -(5^n) * 2
        elseif char == '-'
            decimal += -(5^n)
        end
        n += -1
    end
    return decimal
end

function toSNAFU(decimal)
    n = 0
    while div(decimal, 5^n) > 4
        n += +1
    end
    base5 = []
    while n >= 0
        pushfirst!(base5, div(decimal, 5^n))
        decimal = decimal % 5^n
        n += -1
    end
    push!(base5, 0)
    snafu = ""
    for index in 1:length(base5)
        if base5[index] == 0
            snafu = snafu * "0"
        elseif base5[index] == 1
            snafu = snafu * "1"
        elseif base5[index] == 2
            snafu = snafu * "2"
        elseif base5[index] == 3
            snafu = snafu * "="
            base5[index+1] += 1
        elseif base5[index] == 4
            snafu = snafu * "-"
            base5[index+1] += 1
        elseif base5[index] == 5
            snafu = snafu * "0"
            base5[index+1] += 1
        end
    end
    if snafu[end] == '0'
        snafu = snafu[1:end-1]
    end
    return reverse(snafu)
end

println(toSNAFU(sum((x) -> toDecimal(x), data)))