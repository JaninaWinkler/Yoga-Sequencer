require 'yaml'

model =   {
  'Mountain'=> {
    'Samasthitihi'=> 0.2,
    'Upward Salute'=> 0.4,
    'Hands on Hips'=> 0.3,
    'Forward Fold' => 0.1
  },
  'Hands on Hips'=> {
    'Foward Fold'=>0.4,
    'Mountain'=>0.1,
    'Upward Salute'=>0.4,
    'Samasthitihi'=>0.1
    },
  'Halfway Lift'=> {
    'Forward Fold'=> 0.4,
    'Plank'=> 0.2,
    'Downward Facing Dog'=> 0.1,
    'Final Downward Facing Dog'=> 0.1,
    'Four-Limb Staff'=>0.2
  },
  'Big Toe Pose'=> {
    'Forward Fold'=> 1.0
    },
  'Forward Fold'=> {
    'Upward Salute'=> 0.2,
    'Halfway Lift'=> 0.2,
    'Plank'=> 0.2,
    'Big Toe Pose'=> 0.2,
    'Final Downward Facing Dog'=>0.1,
    'Downward Facing Dog'=>0.1
  },
  'Plank'=> {
    'Four-Limb Staff'=> 0.5,
    'Final Downward Facing Dog'=> 0.1,
    'Downward Facing Dog'=> 0.4
  },
  'Four-Limb Staff'=> {
    'Upward Facing Dog'=> 0.4,
    'Cobra'=> 0.4,
    'Plank'=>0.2
  }, 
  'Cobra'=> {
    'Plank'=> 1.0,
  },
  'Upward Facing Dog'=> {
    'Downward Facing Dog'=> 0.9,
    'Final Downward Facing Dog'=> 0.1
  },
  'Float to Top of Mat'=> {
    'Forward Fold'=> 0.5,
    'Halfway Lift'=> 0.5
  },
    'Upward Salute'=> {
    'Samasthitihi'=> 0.4,
    'Forward Fold'=> 0.4,
    'Hands on Hips' => 0.1,
  },
    'Samasthitihi'=> {
    'Mountain'=> 0.4,
    'Forward Fold'=> 0.1,
    'Upward Salute'=> 0.5,
  },
    'Downward Facing Dog'=> {
      'Final Downward Facing Dog'=>0.2,
      'Float to Top of Mat'=> 0.5, 
      'Plank'=>0.3,
    }, 
    'Final Downward Facing Dog'=> {
    }
}

File.open('3_model.yml', 'w') { |file| file.write(model.to_yaml) }