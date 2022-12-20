# Advent-of-Code-2022
I'm interested in Machine Learning/Deep Learning and I already know well Python so I decided to learn Julia during Advent of Code 2022.


Day 1:
Did the 1st but I created the resporitory the 3rd
It was my first program in Julia, so I took time to open and parse the input.
I understood that in Julia we can use function on array like sum or map as we use in javascript.
I learn that the functions with a ! are "in place functions".

Day 2:
Did the 2nd but I created the resporitory the 3rd
I used dictonary to solve the problem.
It works well so I didn't have difficulties.

Day 3:
Did the 3rd
I used again dictonary.
I had a problem with Char: '' and String : "" which are not the same type -> I used  only() to convert a String to a Char.
I understood that we cannot index an array with a float despite it is 1.0 , 2.0 , ect...

Day 4:
Did the 4th
I made use of mathematical operator of julia on set (inclusion and intersection)
It is very efficient so I solved the problem in few lines
I enjoy more and more function like filter or map

Day 5:
Did the 5th but I forgot to push it
I used array to stock the columns, the function push! and pop! 
To do the second part I just put a I just added a stack that I filled and then emptied.
This challenge was cool the main difficuty was to extract the data 

Day 6:
Did the 6th 
I used sets to solve the problem in few lines
In julia the function Set(array) return a set made up of all the DISTINCT elements of the array
With that I had to find the first Set extract from the data with the correct length
this day is the one I've finished the fastest so far , I learn how to deal with sets

Day 7:
did the 7th but I forgot to push it
I used doubled linked Tree 
I learn how to make structure in julia it will be usefull
first I had an other idea : stock the resporitory in the array which corresponded to his deep and then compute the size from the deepest level to the shallowest level, I spent time on it but i realised that the fact that two resporitory can have the same name was a big problem

Day 8:
did the 8th
I think that the structure that I choose for the first part was bad I had to start again for the second one
I learn nothing special about Julia

Day 9:
first part did the 10th the second part is comming
I used structure to remember positions of head and tail and the previous position of head, each stepI check if tail touch the head, if not the tail take the previous position of the head.
However this don't work for the second part....

Day 10:
did the 11th because the world cup was amazing this week end
it was not a very difficult problem , the only difficulty was to respect the order of the action into a cycle

Day 11: 
first part did the 14th and the second the 15th
the first part was easy
for the second, first i decided to represent a big number by an array which contents the modulo by each monkey divison criter but then i understood  that  we need to know only the modulo of big number by the product of each monkey division criter


Day 12:


Day 13 :
did the 19th I got a little late :(
I create the array for that i used a stack and when there is "[" I push an empty array on the stack , when there is a number i push this number on the last array on the stack , and there is a "]" i pushed the last array on the stack on the penultimate array of the stack
Then I used recursivity to solve the 1st part
for the second part i wanted to use the fusion sort but i had a problem with the fusion so i did a insertion sort

Day 14 :
did the 19th
I used a dictionnary to know if in a position there is a rock a sable
for the second part i just change the movment function : if the deep of the position is one up to the floor , i stop the movment .
I didn't learn something new with julia

Day 20:
did the 20th
I used a double linked list to deal with circular array
for the part2 i only store the rest of the eucledian divison of the product of the value and the big number by the length of the array minus 1
it was a great solution to deal with big number but i wasted time because at the beginning I was doing eucledian division by length instead of length minus 1

