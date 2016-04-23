require 'yaml'

model =   {
  'Standing'=> {
  'Standing'=> 0.2,
  'Transition'=> 0.4,
  'Seated'=> 0.1,
  'Backbend'=> 0.1,
  'Hips'=> 0.1,
  'Core'=> 0.1
  },
  'Seated'=> {
  'Standing'=> 0.2,
  'Transition'=> 0.2,
  'Core'=> 0.2,
  'Backbend'=> 0.2,
  'Hips'=> 0.1,
  'Savasana'=> 0.1
  },
  'Core'=> {
  'Standing'=> 0.2,
  'Transition'=> 0.2,
  'Seated'=> 0.1,
  'Backbend'=> 0.3,
  'Hips'=> 0.1, 
  'Savasana'=> 0.1
  },
  'Backbend'=> {
  'Standing'=> 0.1,
  'Transition'=> 0.3,
  'Seated'=> 0.1,
  'Backbend'=> 0.2,
  'Core'=> 0.1,
  'Hips'=> 0.1, 
  'Savasana'=> 0.1
  },
  'Transition'=> {
  'Standing'=> 0.4,
  'Seated'=> 0.1,
  'Core'=> 0.2,
  'Backbend'=> 0.1,
  'Hips'=> 0.1,
  'Transition'=> 0.2
  },
  'Hips'=> {
  'Standing'=> 0.2,
  'Transition'=> 0.2,
  'Seated'=> 0.2,
  'Core'=> 0.2,
  'Backbend'=> 0.2
  },
  'Savasana'=> {

  }
}

<<<<<<< HEAD
File.open('8_model.yml', 'w') { |file| file.write(model.to_yaml) }
=======
File.open('Move_model.yml', 'w') { |file| file.write(model.to_yaml) }
>>>>>>> bc2e93b32a418aaa08ef94ac723beb9d94bda7ac
