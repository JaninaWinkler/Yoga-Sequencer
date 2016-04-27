require 'yaml'
require 'byebug'
require 'json'

class Sequence < ActiveRecord::Base

  OUTLINE_TIME_CONSTRAINTS = [[3, 5], [4, 6], [5, 7]]
    # Generates a sequence (Array) of yoga poses as Strings based on input
    def generate(time, start, focus)
      outline = create_outline(time, start, focus)
      subsequences = outline.map { |type| create_subsequence(type) }
      sequence = subsequences.flatten
    end

  # Loads the model based on type of sequence or subsequence
  def load_model(version)
    YAML.load(File.read("app/models/sequence_models/#{version}_model.yml"))
  end

  def finished?(outline, model)
    model[outline.last].values.reduce(0.0) { |sum, value| sum + value } == 0.0
  end

    # Given a starting position, focus, and time, creates an outline for a sequence as
    # an Array of Strings representing the types of subsequences
    def create_outline(time, start, focus)
      # initialize the outline with the start type
      # binding.pry
      model = load_model(focus) 
      min, max = OUTLINE_TIME_CONSTRAINTS[time - 1]
      outline = []
      until outline.length.between?(min, max)
        outline.clear
        outline << start
        populate_outline(outline, model, start)
      end
      outline
    end

  def populate_outline(outline, model, start)
    until finished?(outline, model)
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
  end

  def create_subsequence(type)
    sequence_model = load_model(type)
    if type == 'Standing'
      min = 8
      max = 11
    elsif type == 'Transition'
      min = 6
      max = 10
    elsif type == 'Seated'
      min = 8
      max = 10
    elsif type == 'Core'
      min = 8
      max = 12
    elsif type == 'Backbend'
      min = 8
      max = 12
    elsif type == 'Hips'
      min = 6
      max = 8
    elsif type == 'Savasana'
      min = 1
      max = 1
    end
    sequence = []
    until sequence.length.between?(min, max)
      sequence.clear
      populate_sequence(sequence, sequence_model)
    end
    sequence 
  end

  def populate_sequence(sequence, sequence_model)
    if sequence_model.include?('Squat') 
      sequence << 'Squat'
    elsif sequence_model.include?('Mountain')
      sequence << 'Mountain'
    else 
      sequence << sequence_model.keys.sample
    end
    until finished?(sequence, sequence_model)
      r = rand
      acc = 0.0
      sequence_model[sequence.last].each do |key, value|
        acc += value
        if r <= acc
          sequence << key
          break
        end
      end
    end
  end
end

# sequence = Sequence.new
# sequence.generate(2, 'Standing', 'Move')