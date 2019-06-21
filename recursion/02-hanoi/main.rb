def move(n, starting, goal)
    intermediate = [1, 2, 3].find { |n| n != starting and n != goal }
    puts "Move #{n} discs from #{starting} to #{goal}"
    if n == 2
        puts "#{starting}->#{intermediate}"
    else
        move(n - 1, starting, intermediate)
    end
    puts "#{starting}->#{goal}"
    if n == 2
        puts "#{intermediate}->#{goal}"
    else
        move(n - 1, intermediate, goal)
    end
end
  
def move_1(starting, goal)
    puts "#{starting}->#{goal}"
end
  
def hanoi_steps(number_of_discs)
    if number_of_discs == 1
        move_1(1, 3)
    else
        move(number_of_discs, 1, 3)
    end
end
  
# hanoi_steps(2)
# hanoi_steps(3)
# => 1->3 
#    1->2
#    3->2
#    1->3
#    2->1
#    2->3
#    1->3

hanoi_steps(4)
# => 1->2
#    1->3
#    2->3
#    1->2
#    3->1
#    3->2
#    1->2
#    1->3
#    2->3
#    2->1
#    3->1
#    2->3
#    1->2
#    1->3
#    2->3