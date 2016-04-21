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

File.open('Relax_model.yml', 'w') { |file| file.write(model.to_yaml) }