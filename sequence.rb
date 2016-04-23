require 'csv'


def to_boolean(str)
  if str=="TRUE" || str=="true"
    true
  elsif str=="FALSE" || str=="false"
    false
  else 
    str
  end
end

keys = ['number', 'pose_name', 'intensity', 'standing', 'sitting', 'image', 'target_area', 'twist', 'balance']

standing_postures_without_boolean = CSV.read('Yoga Spreadsheet - Sheet1.csv', headers: false).map do
  |a| Hash[ keys.zip(a) ]
end

standing_postures = standing_postures_without_boolean.each do 
  |posture| to_boolean(posture)
end

puts standing_postures