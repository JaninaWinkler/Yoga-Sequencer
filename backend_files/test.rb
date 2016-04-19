puts "How much time? 1, 2 or 3?"
puts ">"
time = gets.chomp

case time
  when '1' || 'A bit..'
    min = 3
    max = 6
    puts "3-6"
  when '2' || 'A fair amount.'
    min = 5
    max = 7
    puts "5-7"
  when '3' || 'Tons!'
    min = 7
    max = 9
    puts "7-9"
  else
    puts "huh?"
  end

puts "How much energy? 1, 2 or 3?"
puts ">"
energy = gets.chomp

case energy
  when '1' || 'turtle'
    puts "Transition: 3000 ms"
  when '2' || 'puppy'
    puts "Transition: 2000 ms"
  when '3' || 'stallion'
    puts "Transition: 1000 ms"
  else
    default
    puts "huh?"
  end

puts "Stretch, Move, Strength or Relax?"
puts ">"
goal = gets.chomp

case goal
  when 'Stretch'
{
  'standing'=> 0.3,
  'seated'=> 0.4,
  'core'=> 0.0,
  'backbend'=> 0.3,
}
puts "30% standing, 30% backbend, 40% seated."
  when 'Move'
{
  'standing'=> 0.6,
  'seated'=> 0.1,
  'core'=> 0.1,
  'backbend'=> 0.2,
}
puts "60% standing, 10% seated, 10% core, 20% backbend."    
  when 'Strength'
{
  'standing'=> 0.6,
  'seated'=> 0.1,
  'core'=> 0.2,
  'backbend'=> 0.1,
}
puts "60% standing, 10% seated, 20% core, 10% backbend."    
  when 'Relax'
{
  'standing'=> 0.2,
  'seated'=> 0.7,
  'core'=> 0.0,
  'backbend'=> 0.1,
}
puts "20% standing, 70% seated, 10% backbend."    
  else
    default
    puts "huh?"
  end