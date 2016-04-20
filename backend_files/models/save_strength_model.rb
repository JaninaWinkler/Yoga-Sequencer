require 'yaml'

model =   {
  'Standing'=> {
  'Standing'=> 0.4,
  'Transition'=> 0.3,
  'Backbend'=> 0.1,
  'Core'=> 0.2
  },
  'Core'=> {
  'Standing'=> 0.3,
  'Transition'=> 0.3,
  'Backbend'=> 0.3,
  'Savasana'=> 0.1
  },
  'Backbend'=> {
  'Standing'=> 0.2,
  'Transition'=> 0.2,
  'Backbend'=> 0.1,
  'Core'=> 0.2,
  'Savasana'=> 0.1
  },
  'Transition'=> {
  'Standing'=> 0.5,
  'Core'=> 0.3,
  'Backbend'=> 0.1,
  'Transition'=> 0.1
  },
  'Savasana'=> {

  }
}

File.open('9_model.yml', 'w') { |file| file.write(model.to_yaml) }