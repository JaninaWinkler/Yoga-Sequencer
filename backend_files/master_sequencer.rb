require 'yaml'
require 'pry'
require 'json'

def load_model(version)
  YAML.load(File.read("models/#{version}_model.yml"))
end

def create_outline(time, start, focus)
  @seq2 = []
  sequence_model = load_model(focus)
    if time == '1'
      sequence = generate_outline_sequence(sequence_model, start, 5, 7)
    elsif time == '2'
      sequence = generate_outline_sequence(sequence_model, start, 6, 8)
    elsif time == '3'
      sequence = generate_outline_sequence(sequence_model, start, 7, 9)
    end
end

def create_sequence(type)
  sequence_model = load_model(type)
  if type == 'Standing'
    min = 7
    max= 10
  elsif type == 'Transition'
    min = 5
    max= 7
  elsif type == 'Seated'
    min = 5
    max= 9
  elsif type == 'Core'
    min = 3
    max= 6
  elsif type == 'Backbend'
    min = 3
    max= 6
  elsif type == 'Hips'
    min = 4
    max= 7
  end 
  # if type == 'Savasana'
  #   File.open('../public/javascript/data.json', 'w') {|file| file.write("data = '" + @seq2.flatten.to_json + "';")}
  #   # rating = get_rating
  #   # save_sequence(sequence, rating)
  # else
    generate_sequence(sequence_model, min, max)
end

def finished?(sequence, model)
  # puts "Last element of sequence: #{model[sequence.last]}"
  # puts "Values of last element of sequence: #{model[sequence.last].values}"
  model[sequence.last].values.reduce(0.0) { |sum, value| sum + value } == 0.0
end

def generate_outline_sequence(model, start, min_length = 3, max_length = 7)
  seq = []
  until seq.length.between?(min_length, max_length)
    seq.clear
    populate_outline_sequence(seq, start, model)
  end
  seq.each do |type|
    if type == 'Savasana'
      ###
    else  
      sequence = create_sequence(type) 
      sequences = [sequence]
      show_sequence(sequences) 
    end
  end
  seq
end

def insert_subsequent_sequence(seq, model)
  ## This is where the weight of each type of sequence is determined based on goal
  ## entered as input
  r = rand
  acc = 0.0
  model[seq.last].each do |key, value|
    acc += value
    if r <= acc
      seq << key
      break
    end
  end
end

def populate_outline_sequence(seq, start, model)
  seq << start
  until finished?(seq, model)
    insert_subsequent_sequence(seq, model)
  end
end

def generate_sequence(model, min_length = 3, max_length = 7)
  seq = []
  until seq.length.between?(min_length, max_length)
    seq.clear
    populate_sequence(seq, model)
  end
  seq
end

def insert_initial_pose(seq, model)
  if model.include?('Squat') 
    seq << 'Squat'
  elsif model.include?('Mountain')
    seq << 'Mountain'
  else 
    seq << model.keys.sample
  end
end

def insert_subsequent_pose(seq, model)
  r = rand
  acc = 0.0
  model[seq.last].each do |key, value|
    acc += value
    if r <= acc
      # binding.pry
      seq << key
      break
    end
  end
end

def populate_sequence(seq, model)
  insert_initial_pose(seq, model)
  until finished?(seq, model)
    insert_subsequent_pose(seq, model)
  end
end

# def show_sequence(sequences)
#   @seq2.push(sequences)
#   sequences.each do | sequence |
#     sequence.each_with_index do |pose, index|
#       puts "#{index + 1}: #{pose}"
#     end
#   end
# end

# def save_sequence(sequence, rating)
#   # put it in the db
#   puts "putting it in the db with rating: #{rating}"
# end

# def get_rating
#   print 'Any good? (Y/n) '
#   gets.chomp != 'n'
# end

def main 
  puts "Focus?"
  focus = gets.chomp
  puts "How much time?"
  time = gets.chomp
  puts "<"
  puts "Start where?"
  start = gets.chomp
  create_outline(time, start, focus)
end 

main

# if $0 == __FILE__ 
#   main
# end
# # create_sequence('Standing')