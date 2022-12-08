f = open("data7.txt")
readline(f)
data = read(f, String)
close(f)
data = split(data, "\r\n")
pop!(data)

mutable struct Res
    name::String
    filesize::Int64
    father::Union{Res,Nothing}
    children::Dict
end

mutable struct Tree
    current::Res
end

memory = []

function add(tree, line, memory)
    line = split(line, " ")
    new = Res(line[2], 0, tree.current, Dict())
    tree.current.children[line[2]] = new
    push!(memory, new)
end

function addFileSize(tree, line)
    size = parse(Int64, split(line, " ")[1])
    tree.current.filesize += size
end

function move(tree, line)
    name = split(line, " ")[3]
    if name == ".."
        tree.current = tree.current.father
    else
        tree.current = tree.current.children[name]
    end
end

function execute(tree, line, memory)
    if line[1] in '1':'9'
        addFileSize(tree, line)
    elseif line[1] == 'd'
        add(tree, line, memory)
    elseif line[3:4] == "cd"
        move(tree, line)
    end
end

function resSize(res)
    if length(res.children) == 0
        return res.filesize
    else
        return res.filesize + sum(resSize(child[2]) for child in res.children)
    end
end

first = Res("/", 0, nothing, Dict())
tree = Tree(first)
map((x) -> execute(tree, x, memory), data)
sizes = map((x) -> resSize(x), memory)
#solution 1
#print(sum((x) -> x, filter((x) -> x <= 100000, sizes)))

#solution 2
push!(sizes, resSize(first))
space = sizes[end] - 40000000
print(minimum((x) -> x, filter((x) -> x >= space, sizes)))
