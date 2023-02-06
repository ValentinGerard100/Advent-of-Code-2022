Welcome to my Advent of Code 2022 repository, where I am documenting my journey of learning Julia while solving coding challenges.

Day 1

I completed the first challenge on December 1st but only created this repository on December 3rd. This was my first program in Julia, so it took me some time to understand how to open and parse the input. I learned that in Julia, we can use functions on arrays like sum or map, just like in JavaScript. I also discovered that functions with a ! are "in place functions".

Day 2

I completed the second challenge on December 2nd but, once again, created this repository on December 3rd. For this challenge, I used dictionaries to solve the problem and found it to be a straightforward solution.

Day 3

I completed the third challenge on December 3rd. For this challenge, I used dictionaries once again. I encountered a problem with the difference between the Char: '' and String : "" data types, but was able to resolve it by using the only() function to convert a string to a character. I also learned that we cannot index an array with a float, despite it being 1.0, 2.0, etc.

Day 4

I completed the fourth challenge on December 4th. For this challenge, I made use of mathematical operators in Julia on sets (inclusion and intersection). The solution was very efficient, and I was able to solve the problem in just a few lines of code. I am enjoying using functions such as filter and map more and more.

Day 5

I completed the fifth challenge on December 5th, but unfortunately forgot to push it to this repository. I used arrays to stock the columns and the functions push! and pop! to solve the problem. For the second part, I just added a stack that I filled and then emptied. This challenge was cool, and the main difficulty was extracting the data.

Day 6

I completed the sixth challenge on December 6th. I used sets to solve the problem in just a few lines of code. In Julia, the Set(array) function returns a set made up of all the distinct elements of the array. To find the first set in the data with the correct length, I had to extract the data and then find the set with the right length. This was the fastest day so far, and I learned how to work with sets.

Day 7

I completed the seventh challenge on December 7th, but once again, forgot to push it to this repository. I used a double-linked tree to solve the problem. I learned how to create structures in Julia, which will be useful in future challenges. Initially, I had a different idea: to stock the repository in an array that corresponded to its depth, and then compute the size from the deepest level to the shallowest level. However, I soon realized that the fact that two repositories can have the same name was a big problem.

Day 8

On the 8th day, I realized that the structure I had chosen for the first part of the task was not ideal. I had to start over for the second part. I didn't learn anything special about Julia today.

Day 9

I was able to complete the first part on the 10th and the second part is coming along. I used a structure to remember the positions of the head and tail, as well as the previous position of the head. Each step I checked if the tail touched the head, and if not, the tail took the previous position of the head. However, this approach didn't work for the second part.

Day 10

I was able to complete the 11th day's task as the World Cup over the weekend was amazing. The problem was not very difficult, the only challenge was to respect the order of the actions within a cycle.

Day 11

I completed the first part on the 14th and the second part on the 15th. The first part was easy, but for the second, I first decided to represent a big number by an array of modulo results from each monkey division criterion. However, I later realized that we only need to know the modulo of the big number by the product of each monkey division criterion.

Day 13

I was a bit late, but I completed the 19th day on the same day. To solve the task, I created an array using a stack. Whenever there was a "[", I pushed an empty array onto the stack. When there was a number, I pushed the number onto the last array on the stack. And when there was a "]", I pushed the last array onto the stack onto the second-to-last array of the stack. I then used recursion to solve the first part. For the second part, I wanted to use the fusion sort, but I had a problem with the fusion, so I used an insertion sort instead.

Day 14
I completed task 19th. I used a dictionary to determine if a position had a rock or a sand. For the second part, I modified the movement function by stopping the movement if the depth of the position was one up from the floor. I didn't learn anything new about Julia.

Day 15

I completed task 21st. The first part was easy, I just looked at the raw y=2000000. But for the second part, I spent a lot of time on it. I first tried a brute force approach, but it was a very bad solution. So, I decided to work with the frontiers of the Manhattan sphere because the point we are looking for must be between two frontiers that are only 1 apart.

Day 17

I completed task 1st January. I passed the first part, but for the second part I found the cycle but couldn't understand why the answer was incorrect. I stopped working on it as I was getting upset.

Day 20

I completed task 20th. I used a double-linked list to handle a circular array. For the second part, I stored the remainder of the Euclidean division of the product of the value and the big number by the length of the array minus 1. This was a great solution for dealing with large numbers, but I wasted time because at first I was dividing by the length instead of length minus 1.

Day 21

I completed task 21st. I used a dictionary to store data in a tree-like structure, and then used recursion to compute the root value. For the second part, I tried a brute force approach first, but it didn't work. So, I used symbolic variables to get an equation on the root and then solved it. I learned how to solve equations and use symbolic variables in Julia with SymPy.

Day 22

I completed task 22nd, though it took me a whole day. I enjoyed the problem though. I used a dictionary to represent the map, and then added "portals" at the borders. I created a dictionary to store the portals, and the given key (x_entry, y_entry, direction_entry) would return (x_exit, y_exit, direction_exit). My solution worked well for all types of inputs for part 1, but only for inputs of the same shape for part 2.

Day 23

I completed task 23rd. I stored the positions in a dictionary where the key is the position and the value is the next desired position. In another dictionary, I had the desired position as the key and the number of elves wanting to go there as the value. For the second part, I just added a counter for each turn and checked if the counter was equal to the number of elves.

Day 25

I completed task 29th. I created two functions: ToDecimal and ToSNAFU. To compute the SNAFU representation of a number, I converted it to base 5. For each power of 5, if it was 5, 4, or 3, I would increment the next power by 1 and change the current number to 0, -, or =.

Final

I had a great time during this experience. I feel confident with my skills in Julia, even though my code could be cleaner. I have mostly used basic data structures, which I haven't optimized. I have learned a lot and I think I have become a better and more efficient coder as I spend less time debugging my code.
The challenges were interesting and I enjoyed working on them, however, I regret not having enough time to complete them all as I also needed to study for upcoming exams.

