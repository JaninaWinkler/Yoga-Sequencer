require 'yaml'
require 'json'

def load_model(version)
  YAML.load(File.read("#{version}_model.yml"))
end

def create_outline(time, start)
  @seq2 = []
    sequence_model = load_model(1)
  # loop do
  if time == '1'
    sequence = generate_outline_sequence(sequence_model, start, 3, 5)
  elsif time == '2'
    sequence = generate_outline_sequence(sequence_model, start, 5, 7)
  elsif time == '3'
    sequence = generate_outline_sequence(sequence_model, start, 7, 9)
  end
    sequences = [sequence]
    show_sequence(sequences)
  # end
end

def create_sequence(type)
  if type == 'Standing'
    sequence_model = load_model(2)
  elsif type == 'Transition'
    sequence_model = load_model(3)
  elsif type == 'Seated'
    sequence_model = load_model(4)
  elsif type == 'Core'
    sequence_model = load_model(5)
  elsif type == 'Backbend'
    sequence_model = load_model(6)
  elsif type == 'Savasana'
    rating = get_rating
    File.open('../public/javascript/data.json', 'w') {|file| file.write("data = '" + @seq2.flatten.to_json + "';")}
    save_sequence(sequence, rating)
  end
    sequence = generate_sequence(sequence_model, 5, 5)
    sequences = [sequence]
    show_sequence(sequences)
end

def finished?(sequence, model)
  # puts "Last element of sequence: #{model[sequence.last]}"
  # puts "Values of last element of sequence: #{model[sequence.last].values}"
  model[sequence.last].values.reduce(0.0) { |sum, value| sum + value } == 0.0
end

def generate_sequence(model, min_length = 3, max_length = 7)
  seq = []
  until seq.length.between?(min_length, max_length)
    seq.clear
    populate_sequence(seq, model)
  end
  seq
end

def generate_outline_sequence(model, start, min_length = 3, max_length = 7)
  seq = []
  until seq.length.between?(min_length, max_length)
    seq.clear
    populate_outline_sequence(seq, start, model)
  end
  seq = seq.each do |e| create_sequence(e) end
  seq
end

def insert_initial_sequence(seq, start, model)
    seq << start
end

def insert_subsequent_sequence(seq, model)
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
  insert_initial_sequence(seq, start, model)
  until finished?(seq, model)
    insert_subsequent_sequence(seq, model)
  end
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

def show_sequence(sequences)
  @seq2.push(sequences)
  # print @seq2.flatten
  sequences.each do | sequence |
    sequence.each_with_index do |pose, index|
      puts "#{index + 1}: #{pose}"
    end
  end
  # binding.pry
end

def save_sequence(sequence, rating)
  # put it in the db

  puts "putting it in the db with rating: #{rating}"
end

def get_rating
  # binding.pry
  print 'Any good? (Y/n) '
  gets.chomp != 'n'
end

puts "How much time?"
time = gets.chomp
puts "<"
puts "Start where?"
start = gets.chomp
create_outline(time, start)
# create_sequence('Standing')