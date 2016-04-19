require 'yaml'

model =   {
  'Standing'=> {
  'Standing'=> 0.2,
  'Transition'=> 0.3,
  'Seated'=> 0.2,
  'Core'=> 0.2,
  'Backbend'=> 0.1
  },
  'Transition'=> {
  'Standing'=> 0.4,
  'Seated'=> 0.2,
  'Core'=> 0.2,
  'Backbend'=> 0.2
  },
  'Seated'=> {
  'Standing'=> 0.1,
  'Transition'=> 0.1,
  'Seated'=> 0.3,
  'Core'=> 0.2,
  'Backbend'=> 0.2,
  'Savasana'=> 0.1
  },
  'Core'=> {
  'Standing'=> 0.1,
  'Transition'=> 0.1,
  'Seated'=> 0.3,
  'Core'=> 0.1,
  'Backbend'=> 0.4,
  'Savasana'=> 0.1
  },
  'Backbend'=> {
  'Standing'=> 0.1,
  'Transition'=> 0.1,
  'Seated'=> 0.5,
  'Core'=> 0.1,
  'Backbend'=> 0.1,
  'Savasana'=> 0.1
  },
  'Savasana'=> {

  }
}

File.open('1_model.yml', 'w') { |file| file.write(model.to_yaml) }