require 'yaml'

model = {
  'Squat' => {
  'Runners Lunge'=> 0.1,
  'Sleeping Pigeon'=> 0.1,
  'Low Crescent Lunge'=> 0.1,
  'Cow Face'=> 0.1,
  'Corpse'=> 0.1,
  'Marichis Pose'=> 0.1, 
  'Ragdoll'=> 0.2,
  'Staff'=> 0.2
  },
  'Staff'=> {
  'Forward Fold' => 0.3,
  'Wide-Legged Fold'=> 0.1,
  'Cow Face'=> 0.1,
  'Bound Angle'=> 0.2,
  'Corpse'=> 0.1,
  'Marichis Pose'=> 0.1,
  'Squat'=> 0.1
  },
  'Forward Fold' => {
  'Wide-Legged Fold'=> 0.2,
  'Cow Face'=> 0.1,
  'Bound Angle'=> 0.2,
  'Corpse'=> 0.2,
  'Marichis Pose'=> 0.1,
  'Staff'=> 0.2
  },
  'Wide-Legged Fold'=> {
  'Forward Fold' => 0.1, 
  'Cow Face'=> 0.2,
  'Bound Angle'=> 0.2,
  'Corpse'=> 0.2,
  'Marichis Pose'=> 0.1, 
  'Staff'=> 0.2,
  },
  'Runners Lunge'=> {
  'Sleeping Pigeon'=> 0.3,
  'Low Crescent Lunge'=> 0.3,
  'Ragdoll'=> 0.2,
  'Squat'=> 0.2
  },
  'Sleeping Pigeon'=> { 
  'Runners Lunge'=> 0.2,
  'Low Crescent Lunge'=> 0.2, 
  'Cow Face'=> 0.1,
  'Bound Angle'=> 0.1,
  'Frog'=> 0.2,
  'Squat'=> 0.2
  },
  'Low Crescent Lunge'=> {
  'Runners Lunge'=> 0.3, 
  'Sleeping Pigeon'=> 0.2,
  'Ragdoll'=> 0.2,
  'Squat'=> 0.3
  },
  'Cow Face'=> {
  'Forward Fold' => 0.1,
  'Wide-Legged Fold'=> 0.2,
  'Bound Angle'=> 0.2,
  'Corpse'=> 0.1,
  'Marichis Pose'=> 0.1,  
  'Staff'=> 0.2, 
  'Squat'=> 0.1,
  },
  'Bound Angle'=> {
  'Forward Fold' => 0.1,
  'Wide-Legged Fold'=> 0.1,
  'Cow Face'=> 0.1,
  'Corpse'=> 0.1,
  'Marichis Pose'=> 0.1,
  'Reclining Bound Angle Pose'=> 0.3,
  'Staff'=> 0.1,
  'Squat'=> 0.1
  },
  'Frog'=> {
  'Runners Lunge'=> 0.1,
  'Sleeping Pigeon'=> 0.2,
  'Corpse'=> 0.2,
  'Ragdoll'=> 0.1,
  'Staff'=> 0.2,
  'Squat'=> 0.2,
  },
  'Corpse'=> {
  'Happy Baby'=> 0.3,
  'Thread The Needle'=> 0.3,
  'Reclining Bound Angle Pose'=> 0.3,
  'Staff'=> 0.1
  },
  'Happy Baby'=> {
  'Corpse'=> 0.2,
  'Thread The Needle'=> 0.2,
  'Reclining Bound Angle Pose'=> 0.2,
  'Staff'=> 0.2,
  'Squat'=> 0.2
  },
  'Thread The Needle'=> {
  'Corpse'=> 0.2,
  'Happy Baby'=> 0.4,
  'Reclining Bound Angle Pose'=> 0.2,
  'Staff'=> 0.1,
  'Squat'=> 0.1
  }, 
  'Marichis Pose'=> {
  'Forward Fold' => 0.2, 
  'Wide-Legged Fold'=> 0.1,
  'Cow Face'=> 0.1,
  'Bound Angle'=> 0.1,
  'Frog'=> 0.1,
  'Corpse'=> 0.1,
  'Staff'=> 0.1,
  'Squat'=> 0.2
  },
  'Reclining Bound Angle Pose'=> {
  'Bound Angle'=> 0.1,
  'Corpse'=> 0.1,
  'Happy Baby'=> 0.4,
  'Thread The Needle'=>0.2,
  'Staff'=> 0.2
  },
  'Staff'=> {
  'Forward Fold' => 0.2,
  'Wide-Legged Fold'=> 0.1,
  'Cow Face'=> 0.1,
  'Bound Angle'=> 0.1,
  'Corpse'=> 0.1,
  'Marichis Pose'=> 0.1, 
  'Reclining Bound Angle Pose'=> 0.1, 
  'Squat'=> 0.2
  },
  'Ragdoll'=> {
  }
}

File.open('11_model.yml', 'w') { |file| file.write(model.to_yaml) }