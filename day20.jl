f = open("data20.txt")
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)
data = map((x) -> parse(Int64, x), data)


mutable struct Node
    value
    right
    left
end

positionList = []

map((x) -> push!(positionList, Node(x, nothing, nothing)), data)

function clean(x)
    if x >= 0
        return Node(x * 811589153 % (length(data) - 1), nothing, nothing)
    else
        return Node(-(-x) * 811589153 % (length(data) - 1), nothing, nothing)
    end
end

nodeList = []
map((x) -> push!(nodeList, clean(x)), data)

nodeList[1].right = nodeList[2]
nodeList[1].left = nodeList[end]
nodeList[end].left = nodeList[end-1]
nodeList[end].right = nodeList[1]

for i in 2:(length(nodeList)-1)
    nodeList[i].right = nodeList[i+1]
    nodeList[i].left = nodeList[i-1]
end



function move(nodeList)
    for j in 1:10
        for i in 1:length(nodeList)
            head = nodeList[i]
            if head.value != 0
                head.right.left = head.left
                head.left.right = head.right
                if head.value > 0
                    right = head
                    for j in 1:head.value
                        right = right.right
                    end
                    head.right = right.right
                    head.left = right
                    head.right.left = head
                    head.left.right = head
                else
                    head.value < 0
                    left = head
                    for j in 1:-head.value
                        left = left.left
                    end
                    head.left = left.left
                    head.right = left
                    head.right.left = head
                    head.left.right = head
                end
            end
        end
    end
    return nodeList
end

function solution1(nodeList, positionList)
    indexzero = findfirst((x) -> x.value == 0, positionList)
    right = nodeList[indexzero]
    sum = 0
    for j in 1:3
        for i in 1:1000
            right = right.right
        end
        index = findfirst((x) -> x == right, nodeList)
        sum += positionList[index].value
    end
    return sum * 811589153
end



nodeList = move(nodeList)
println(solution1(nodeList, positionList))






