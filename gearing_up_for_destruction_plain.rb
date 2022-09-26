puts '# of pegs:'
pegNumber = gets("\n").chomp
puts 'peg x coordinate:'
pegLocation = gets.chomp.split(' ').map(&:to_i).sort
cogRadii = []
between =[]
twoFour = []
signs = []
output = []
counter = pegLocation.length-1
until counter == 0
    between.unshift(pegLocation[counter] - pegLocation[counter -1])
    counter -= 1
    end
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
  output.push(pegLocation[index] * twoFour[index] * signs[index])
end
outputTotal = output.sum
if pegLocation.length.even?
    cogOne= outputTotal/ 3
elsif
    cogOne = outputTotal
end
cogRadii.push(cogOne)
until counter == pegLocation.length-1
cogRadii.push(between[counter]-cogRadii[counter])
counter += 1
end
if cogRadii.all? {|num| num>=1} &&
    cogRadii[counter] * 2 == cogRadii[0]
    print "(#{cogRadii[0]},1)" 
  elsif
    print "(-1, -1)"
end