require 'yaml'

def main
  model = load_model(2)
  loop do
    sequence = generate_sequence(model, 10, 20)
    show_sequence(sequence)
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
  seq << model.keys.sample
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

def show_sequence(sequence)
  sequence.each_with_index do |pose, index|
    puts "#{index + 1}: #{pose}"
  end
end

main