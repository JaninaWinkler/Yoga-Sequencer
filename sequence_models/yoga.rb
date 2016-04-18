require 'yaml'

def multiple_sequences
  standing_model = load_model(2)
  transition_model = load_model(3)
  seated_model = load_model(4)

  loop do
    transition_sequence = generate_sequence(transition_model, 5, 10)
    standing_sequence = generate_sequence(standing_model, 5, 10)
    transition_sequence1 = generate_sequence(transition_model, 3, 5)
    seated_sequence = generate_sequence(seated_model, 5, 10)
    standing_sequence1 = generate_sequence(standing_model, 5, 10)
    sequences = [transition_sequence, standing_sequence, transition_sequence1, seated_sequence, standing_sequence1]
    show_sequence(sequences)
    rating = get_rating
    save_sequence(standing_sequence, rating)
  end
end

def single_sequence
  model = load_model(6)

  loop do
    sequence = generate_sequence(model, 10, 14)
    sequences = [sequence]
    show_sequence(sequences)
    rating = get_rating
    save_sequence(sequence, rating)
  end
end

def save_sequence(sequence, rating)
  # put it in the db
  puts "putting it in the db with rating: #{rating}"
end

def get_rating
  print 'Any good? (Y/n) '
  gets.chomp != 'n'
end

def load_model(version)
  YAML.load(File.read("#{version}_model.yml"))
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

def insert_initial_pose(seq, model)
  ## Having every sequence start and end in mountain pose or downward facing dog?
  ## seq << 'Mountain'
  seq << model.keys.sample
  ## debug below
  # puts seq.last
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
  sequences.each do | sequence |
    sequence.each_with_index do |pose, index|
      puts "#{index + 1}: #{pose}"
    end
  end
end

single_sequence
# multiple_sequences