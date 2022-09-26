=begin
Okay so we start with the Google foo.bar challange below ʕ； •`ᴥ•´ʔ :

As Commander Lambda's personal assistant, you've been assigned the task of configuring the LAMBCHOP doomsday device's axial orientation gears. It should be pretty simple - just add gears to create the appropriate rotation ratio. But the problem is, due to the layout of the LAMBCHOP and the complicated system of beams and pipes supporting it, the pegs that will support the gears are fixed in place.

The LAMBCHOP's engineers have given you lists identifying the placement of groups of pegs along various support beams. You need to place a gear on each peg (otherwise the gears will collide with unoccupied pegs). The engineers have plenty of gears in all different sizes stocked up, so you can choose gears of any size, from a radius of 1 on up. Your goal is to build a system where the last gear rotates at twice the rate (in revolutions per minute, or rpm) of the first gear, no matter the direction. Each gear (except the last) touches and turns the gear on the next peg to the right.

Given a list of distinct positive integers named pegs representing the location of each peg along the support beam, write a function answer(pegs) which, if there is a solution, returns a list of two positive integers a and b representing the numerator and denominator of the first gear's radius in its simplest form in order to achieve the goal above, such that radius = a/b. The ratio a/b should be greater than or equal to 1. Not all support configurations will necessarily be capable of creating the proper rotation ratio, so if the task is impossible, the function answer(pegs) should return the list [-1, -1].

For example, if the pegs are placed at [4, 30, 50], then the first gear could have a radius of 12, the second gear could have a radius of 14, and the last one a radius of 6. Thus, the last gear would rotate twice as fast as the first one. In this case, pegs would be [4, 30, 50] and answer(pegs) should return [12, 1].

The list pegs will be given sorted in ascending order and will contain at least 2 and no more than 20 distinct positive integers, all between 1 and 10000 inclusive.

I programmed in ruby bc its all I know and ignored a lot about the format the answer is given in bc I feel like an interesting scenario deserves some flavor text and not an output like [12,1], fight me ʕง•ᴥ•ʔง
=end

#To start off, this takes the input for the location of the pegs and put the numbers into an array
puts '"How many pegs are there, Commander Lambda?"'
pegNumber = gets("\n").chomp
puts '"And where are the pegs located at Commander?"'
pegLocation = gets.chomp.split(' ').map(&:to_i).sort
# I want to add something to validate the user input but.... nah ʕノ•ᴥ•ʔノ ︵ ┻━┻

#This initializes the arrays and counters
cogRadii = []
between =[]
twoFour = []
signs = []
output = []
counter = pegLocation.length-1

#This creates the array "between" which shows the space between each peg
until counter == 0
    between.unshift(pegLocation[counter] - pegLocation[counter -1])
    counter -= 1
    end

#This creates the "twoFour" array, a "4" sandwich with "2" bread and the "signs" array which alternates between "-1" and "1"
pegLocation.each_with_index do |val, index|
  if index == 0 || index == pegLocation.length - 1
    twoFour.push(2)
  else
    twoFour.push(4)
  end

  if index % 2 == 0
    signs.push(-1)
  else
    signs.push(1)
  end

#This multiplies "between" "twoFour" and "signs" to create the array "output" and then finds the sum of that array
  output.push(pegLocation[index] * twoFour[index] * signs[index])
end
outputTotal = output.sum

#If there are an even number of pegs, the output is divided by 3, these steps follow an equation pattern (see note) in order to find the potential radius of the first cog.
if pegLocation.length.even?
    cogOne= outputTotal/ 3
elsif
    cogOne = outputTotal
end

#By subtracting the potential radius of the first cog from the first gap we find the potential radius of the second cog, then by subtracting the potential radius of the second cog from the second gap we find the potential radius of the third cog and so on. ʕ ꈍᴥꈍʔ
cogRadii.push(cogOne)
until counter == pegLocation.length-1
cogRadii.push(between[counter]-cogRadii[counter])
counter += 1
end

#This validates the potential cog radii by seeing if all cog radii are greater than 1 and the first cog radii is twice the size of the last cog radii
if cogRadii.all? {|num| num>=1} &&
    cogRadii[counter] * 2 == cogRadii[0]

#This prints the answer when we are succesful!  ᕦʕ •ᴥ•ʔᕤ
    print "The first gear's radius will measure #{cogRadii[0]}, Commander Lambda. The pegs are located at #{pegLocation}, with gaps of #{between} in between, and the cog radii will be #{cogRadii}" 

#This tells Commander Lambda if we failed ʕ ´•̥̥̥ ᴥ•̥̥̥`ʔ
  elsif
    print "I am sorry, Commander Lambda, I believe that may be impossible within the constraints given."
end

#So I'm pretty bad at math but part of this program depends on an equation I barely understand  ʅʕ•ᴥ•ʔʃ
#Basically, in the case of 2 pegs z = (-2a+2b)/3
#In the case of 3 pegs z = -2a+4b-2c
#In the case of 4 pegs z = (-2a+4b-4c+2d)/3
#In the case of 5 pegs z = -2a+4b-4c+2d
#In the case of 6 pegs z = (-2a+4b-4c+4d-2e)/3
#And so on... this is probably a well known mathematical concept or whatever but I just noticed the pattern: 4 sandwich with 2 bread, negative then positive, even number of pegs divide by 3 and I ran with it ᕕʕ •ₒ• ʔ୨
#I haven't found a use case it doesn't work with... at least... so far!   Σʕㅇᴥㅇ ʔ

#I just started programming so please tell me if you find use cases that don't work or if you have any reccommendations to condense my code, bye y'all ʕ•ᴥ•ʔﾉ♡
