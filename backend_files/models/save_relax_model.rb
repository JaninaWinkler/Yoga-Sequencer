require 'yaml'

model =   {
  'Standing'=> {
  'Seated'=> 0.6,
  'Backbend'=> 0.2,
  'Hips'=> 0.2
  },
  'Seated'=> {
  'Standing'=> 0.1,
  'Seated'=> 0.4,
  'Backbend'=> 0.1,
  'Hips'=> 0.2,
  'Savasana'=> 0.2
  },
  'Backbend'=> {
  'Standing'=> 0.1,
  'Seated'=> 0.5,
  'Backbend'=> 0.1,
  'Hips'=> 0.2, 
  'Savasana'=> 0.1
  },
  'Transition'=> {
  'Standing'=> 0.1,
  'Seated'=> 0.4,
  'Backbend'=> 0.2,
  'Hips'=> 0.3,
  },
  'Hips'=> {
  'Transition'=> 0.1,
  'Seated'=> 0.4,
  'Backbend'=> 0.4,
  'Savasana'=> 0.1
  },
  'Savasana'=> {

  }
}

<<<<<<< HEAD
File.open('10_model.yml', 'w') { |file| file.write(model.to_yaml) }
=======
File.open('Relax_model.yml', 'w') { |file| file.write(model.to_yaml) }
>>>>>>> bc2e93b32a418aaa08ef94ac723beb9d94bda7ac
