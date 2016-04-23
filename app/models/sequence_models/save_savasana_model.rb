require 'yaml'

model = {
  'Savasana'=> {

  }
}




File.open('Savasana_model.yml', 'w') { |file| file.write(model.to_yaml) }