require 'yaml'

model =   {
  'Standing'=> {
  'Standing'=> 0.4,
  'Transition'=> 0.3,
  'Backbend'=> 0.1,
  'Core'=> 0.2,
  },
  'Core'=> {
  'Standing'=> 0.2,
  'Transition'=> 0.2,
  'Backbend'=> 0.3,
  'Savasana'=> 0.1,
  'Hips'=> 0.2
  },
  'Backbend'=> {
  'Standing'=> 0.1,
  'Transition'=> 0.2,
  'Backbend'=> 0.1,
  'Core'=> 0.1,
  'Hips'=> 0.2, 
  'Savasana'=> 0.1
  },
  'Transition'=> {
  'Standing'=> 0.4,
  'Core'=> 0.3,
  'Backbend'=> 0.1,
  'Hips'=> 0.1,
  'Transition'=> 0.1
  },
  'Seated'=> {
  'Standing'=> 0.3,
  'Transition'=> 0.2,
  'Backbend'=> 0.1,
  'Hips'=> 0.2, 
  'Core'=> 0.2
  },
  'Hips'=> {
  'Standing'=> 0.4,
  'Transition'=> 0.2,
  'Core'=> 0.2,
  'Backbend'=> 0.2
  },
  'Savasana'=> {

  }
}

File.open('9_model.yml', 'w') { |file| file.write(model.to_yaml) }