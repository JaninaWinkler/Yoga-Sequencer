require 'yaml'
require 'pry'
require 'json'

# module Sequencer

  # Generates a sequence (Array) of yoga poses as Strings based on input
  def generate(opts = {})
    defaults = {
      time: 2,
      start: 'Standing',
      focus: 'Stretch'
    }
    opts = opts.reverse_merge(defaults)
    # Make an outline
    outline = create_outline(opts[:time], opts[:start], opts[:focus])
    # Make a sequence of poses for each element of the outline
    sequences = outline.map { |type| create_subsequence(type) }
    # Merge each of the sequences into a single array
    sequences.flatten
  end

  # private

# Loads the model based on type of sequence or subsequence
def load_model(version)
  YAML.load(File.read("models/#{version}_model.yml"))
end

def finished?(sequence, model)
  model[sequence.last].values.reduce(0.0) { |sum, value| sum + value } == 0.0
end

  # Given a starting position, focus, and time, creates an outline for a sequence as
  # an Array of Strings representing the types of subsequences
  def create_outline(time, start, focus)
    # initialize the outline with the start type
    model = load_model(focus) 
    if time == '1'
      min = 5
      max = 7
    elsif time == '2'
      min = 6
      max = 8
    elsif time == '3'
      min = 7
      max = 9
    end
      outline = []
      until outline.length.between?(min, max)
        outline.clear
        outline << start
        until finished?(outline, model)
          populate_outline(outline, model)
        end
      end
    # TODO Insert subsequent subsequence types
    # The final subsequence type is always 'Savasana'
    # outline << :Savasana
    # << load_model('Savasana')
  end

def populate_outline(outline, model)
  r = rand
  acc = 0.0
  model[outline.last].each do |key, value|
    acc += value
    if r <= acc
      outline << key
      break
    end 
  end
end

def populate_sequence(sequence, model)
  r = rand
  acc = 0.0
  model[sequence.last].each do |key, value|
    acc += value
    if r <= acc
      # binding.pry
      sequence << key
      break
    end
  end
end

def create_subsequence(type)
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
  sequence = []
  binding.pry
  until sequence.length.between?(min, max)
    sequence.clear
    if sequence_model.include?('Squat') 
      sequence << 'Squat'
    elsif sequence_model.include?('Mountain')
    sequence << 'Mountain'
    else 
      sequence << model.keys.sample
    end
    sequence
      until finished?(sequence, sequence_model)
        populate_sequence(sequence, sequence_model)
      end
    end
end


sequence = create_outline('2', 'Standing', 'Stretch')
puts sequence

