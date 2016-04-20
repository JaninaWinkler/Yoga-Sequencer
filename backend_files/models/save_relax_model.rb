require 'yaml'

model =   {
  'Standing'=> {
  'Standing'=> 0.1,
  'Seated'=> 0.7,
  'Backbend'=> 0.2,
  },
  'Seated'=> {
  'Standing'=> 0.1,
  'Seated'=> 0.5,
  'Backbend'=> 0.2,
  'Savasana'=> 0.2
  },
  'Backbend'=> {
  'Standing'=> 0.1,
  'Seated'=> 0.7,
  'Backbend'=> 0.1,
  'Savasana'=> 0.1
  },
  'Savasana'=> {

  }
}

File.open('10_model.yml', 'w') { |file| file.write(model.to_yaml) }