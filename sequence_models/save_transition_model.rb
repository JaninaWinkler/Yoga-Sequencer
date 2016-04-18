require 'yaml'

model =   {
  'Mountain'=> {
    'Samasthitihi'=> 0.1,
    'Upward Salute'=> 0.4,
    'Hands on Hips'=> 0.2,
    'Forward Fold' => 0.1,
    'Chair Pose'=> 0.2
  },
  'Hands on Hips'=> {
    'Forward Fold'=>0.4,
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
    'Forward Fold'=> 0.3,
    'Halfway Lift'=> 0.3,
    'Upward Salute'=> 0.2,
    'Plank'=> 0.2
    },
  'Forward Fold'=> {
    'Upward Salute'=> 0.2,
    'Halfway Lift'=> 0.2,
    'Plank'=> 0.1,
    'Big Toe Pose'=> 0.1,
    'Final Downward Facing Dog'=>0.1,
    'Downward Facing Dog'=>0.1,
    'Step to Lunge'=> 0.1,
    'Chair Pose'=> 0.1
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
    'Plank'=> 0.5,
    'Childs Pose'=> 0.5
  },
  'Childs Pose'=> {
    'Downward Facing Dog'=> 0.5,
    'Table Top'=> 0.3,
    'Plank'=> 0.2
  },
  'Table Top'=> {
    'Cat'=> 0.2,
    'Cow'=> 0.2,
    'Plank'=> 0.2,
    'Childs Pose'=> 0.2,
    'Downward Facing Dog'=> 0.2
  },
  'Cat'=> {
    'Table Top'=> 0.4,
    'Cow'=> 0.4,
    'Childs Pose'=> 0.2
  },
  'Cow'=> {
    'Table Top'=> 0.4,
    'Cat'=> 0.4,
    'Childs Pose'=> 0.2
  },
  'Upward Facing Dog'=> {
    'Downward Facing Dog'=> 0.9,
    'Final Downward Facing Dog'=> 0.1
  },
  'Float to Top of Mat'=> {
    'Forward Fold'=> 0.5,
    'Halfway Lift'=> 0.5
  },
  'Handstand'=> {
    'Forward Fold' => 0.7,
    'Four-Limb Staff'=> 0.3
  },
    'Upward Salute'=> {
    'Samasthitihi'=> 0.4,
    'Forward Fold'=> 0.4,
    'Hands on Hips' => 0.2
  },
    'Samasthitihi'=> {
    'Mountain'=> 0.3,
    'Forward Fold'=> 0.1,
    'Upward Salute'=> 0.4,
    'Chair Pose'=> 0.2
  },
    'Downward Facing Dog'=> {
      'Final Downward Facing Dog'=>0.1,
      'Step to Lunge' => 0.2,
      'Float to Top of Mat'=> 0.3, 
      'Plank'=>0.2,
      'Handstand'=> 0.2
    }, 
    'Step to Lunge'=> {
      'Downward Facing Dog'=> 0.3,
      'Plank'=> 0.2,
      'Forward Fold'=> 0.2,
      'Halfway Lift'=> 0.1,
      'Chair Pose'=> 0.1,
      'Handstand'=> 0.1
    },
    'Chair Pose'=> {
      'Forward Fold'=> 0.3,
      'Samasthitihi'=> 0.2,
      'Mountain'=> 0.1,
      'Upward Salute'=> 0.3,
      'Step to Lunge'=> 0.1
    },
    'Final Downward Facing Dog'=> {
    }
}

File.open('3_model.yml', 'w') { |file| file.write(model.to_yaml) }