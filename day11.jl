using Primes
import Primes: factor

mutable struct Monkey
    list
    op
    condition
    ifTrue
    ifFalse
end

monkeys = []
counters = [0, 0, 0, 0, 0, 0, 0, 0]

monkey0 = Monkey([89, 73, 66, 57, 64, 80], [3, 0, 0], 13, 6, 2)
push!(monkeys, monkey0)
monkey1 = Monkey([83, 78, 81, 55, 81, 59, 69], [1, 1, 0], 3, 7, 4)
push!(monkeys, monkey1)
monkey2 = Monkey([76, 91, 58, 85], [13, 0, 0], 7, 1, 4)
push!(monkeys, monkey2)
monkey3 = Monkey([71, 72, 74, 76, 68], [1, 0, 1], 2, 6, 0)
push!(monkeys, monkey3)
monkey4 = Monkey([98, 85, 84], [1, 7, 0], 19, 5, 7)
push!(monkeys, monkey4)
monkey5 = Monkey([78], [1, 8, 0], 5, 3, 0)
push!(monkeys, monkey5)
monkey6 = Monkey([86, 70, 60, 88, 88, 78, 74, 83], [1, 4, 0], 11, 1, 2)
push!(monkeys, monkey6)
monkey7 = Monkey([81, 58], [1, 5, 0], 17, 3, 5)
push!(monkeys, monkey7)

product = 17 * 11 * 5 * 19 * 2 * 7 * 3 * 13

function monkeyTour(i)
    monkeys[i].list = reverse(monkeys[i].list)
    for j in 1:length(monkeys[i].list)
        counters[i] += 1
        stress = pop!(monkeys[i].list)
        if monkeys[i].op[3] == 1
            stress = mod(mod(stress, product)^2, product)
        else
            stress = mod(mod(mod(monkeys[i].op[1], product) * mod(stress, product), product) + mod(monkeys[i].op[2], product), product)
        end
        #stress = Int64(trunc(stress / 3))
        if stress % monkeys[i].condition == 0
            push!(monkeys[monkeys[i].ifTrue+1].list, stress)
        else
            push!(monkeys[monkeys[i].ifFalse+1].list, stress)
        end
    end
end

for i = 1:10000
    for i = 1:8
        monkeyTour(i)
    end
end

number = []
for i in 1:8
    push!(number, counters[i])
end

number = sort(number)
print(number[end] * number[end-1])


