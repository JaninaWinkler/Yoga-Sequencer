require 'yaml'

model = {

  'Wheel'=> {
  'Bridge'=> 0.2,
  'Wild Thing'=>0.2,
  'Hero'=> 0.1,
  'Corpse'=> 0.2,
  'Fish'=> 0.2,
  'Table Top'=> 0.1
  },
  'Bridge'=> {
  'Wheel'=> 0.2,
  'Wild Thing'=>0.2,
  'Hero'=> 0.1,
  'Corpse'=> 0.2,
  'Fish'=> 0.2,
  'Table Top'=> 0.1
  },
  'Camel'=> {
  'Lie on Stomach'=> 0.1,
  'Wheel'=> 0.1,
  'Locust'=> 0.1,
  'Wild Thing'=>0.1,
  'Bridge'=> 0.1,
  'Hero'=> 0.1, 
  'Reclining Hero Pose'=> 0.1,
  'Table Top'=> 0.1,
  'Cat'=> 0.1,
  'Cow'=> 0.1
  },
  'Hero'=> {
  'Camel'=> 0.2,
  'Extended Puppy Dog'=> 0.2,
  'Reclining Hero Pose'=> 0.2,
  'Forward Fold' => 0.2,
  'Easy Pose'=> 0.1,
  'Ragdoll'=> 0.1
  },
  'Reclining Hero Pose'=> {
  'Hero'=> 0.2,
  'Easy Pose'=> 0.2,
  'Lie on Stomach'=> 0.2,
  'Extended Puppy Dog'=> 0.2,
  'Table Top'=> 0.2
  },
  'Cobra'=> {
  'Table Top'=> 0.1,
  'Downward Facing Dog'=> 0.1,
  'Extended Puppy Dog'=> 0.1,
  'Plank'=> 0.1,
  'Sphinx'=> 0.1,
  'Locust'=> 0.1,
  'Bow'=> 0.1,
  'Lie on Stomach'=> 0.1,
  'Cat'=> 0.1,
  'Cow'=> 0.1
  },
  'Extended Puppy Dog'=> {
  'Table Top'=> 0.4,
  'Downward Facing Dog'=> 0.4,
  'Plank'=> 0.2
  },
  'Table Top'=> {
  'Camel'=> 0.1,
  'Hero'=> 0.1, 
  'Extended Puppy Dog'=> 0.1,
  'Cat'=> 0.1,
  'Cow'=> 0.1,
  'Downward Facing Dog'=> 0.2,
  'Plank'=> 0.1,
  'Easy Pose'=> 0.1,
  'Ragdoll'=> 0.1
  },
  'Cat'=> {
  'Hero'=> 0.3,
  'Table Top'=> 0.3,
  'Cow'=> 0.4
  },
  'Cow'=> {
  'Table Top'=> 0.3,
  'Cat'=> 0.4,
  'Extended Puppy Dog'=> 0.3
  },
  'Downward Facing Dog'=> {
  'Extended Puppy Dog'=> 0.1,
  'Table Top'=> 0.1,
  'Plank'=> 0.2,
  'Forward Fold'=> 0.2,
  'Three-Legged Downward Facing Dog'=> 0.2, 
  'Easy Pose'=> 0.1, 
  'Ragdoll'=> 0.1
  }, 
  'Plank'=> {
  'Locust'=> 0.1,
  'Bow'=> 0.2,
  'Sphinx'=> 0.2,
  'Table Top'=> 0.1,
  'Downward Facing Dog'=> 0.1,
  'Lie on Stomach'=> 0.1,
  'Cobra'=> 0.2
  },
  'Lie on Stomach'=> {
  'Cobra'=> 0.1,
  'Three-Legged Downward Facing Dog'=> 0.1, 
  'Table Top'=> 0.1,
  'Plank'=> 0.1,
  'Locust'=> 0.1,
  'Bow'=> 0.1,
  'Sphinx'=> 0.2,
  'Cat'=> 0.1,
  'Cow'=> 0.1
  },
  'Locust'=> {
  'Lie on Stomach'=> 0.1,
  'Sphinx'=> 0.1,
  'Plank'=> 0.1,
  'Squat'=> 0.2,
  'Bridge'=> 0.2,
  'Bow'=> 0.3
  },
  'Bow'=> {
  'Lie on Stomach'=> 0.2,
  'Sphinx'=> 0.3,
  'Locust'=> 0.2,
  'Hero'=> 0.2,
  'Squat'=> 0.1
  },
  'Corpse'=> {
  'Wheel'=> 0.3,
  'Bridge'=> 0.3, 
  'Hero'=> 0.1,
  'Lie on Stomach'=> 0.1,
  'Fish'=> 0.1,
  'Easy Pose'=> 0.1
  },
  'Sphinx'=> {
  'Bow'=> 0.2,
  'Locust'=> 0.2,
  'Lie on Stomach'=> 0.2,
  'Cobra'=> 0.3,
  'Hero'=> 0.1
  },
  'Fish'=> {
  'Corpse'=> 0.3,
  'Wheel'=> 0.3,
  'Bridge'=> 0.3,
  'Hero'=> 0.1
  },
  'Forward Fold' => {
  'Table Top'=> 0.1,
  'Downward Facing Dog'=> 0.1,
  'Plank'=> 0.1,
  'Squat'=> 0.1,
  'Standing Backbend' => 0.3,
  'Easy Pose'=> 0.1,
  'Ragdoll'=> 0.2  
  },
  'Squat'=> {
  'Reclining Hero'=> 0.1,
  'Lie on Stomach' => 0.2,
  'Bridge' => 0.1,
  'Camel'=> 0.1,
  'Three-Legged Downward Facing Dog'=> 0.1,
  'Cobra'=> 0.1,
  'Wheel'=> 0.1,
  'Corpse'=> 0.1,
  'Locust'=> 0.1
  },
  'Standing Backbend' => {
  'Ragdoll'=> 0.2,
  'Forward Fold' => 0.5,
  'Squat'=> 0.3
  },
  'Wild Thing'=> {
  'Wheel'=> 0.3,
  'Downward Facing Dog'=> 0.3,
  'Three-Legged Downward Facing Dog'=> 0.4
  },
  'Three-Legged Downward Facing Dog'=> {
  'Downward Facing Dog'=> 0.4, 
  'Wild Thing'=> 0.3,
  'Fallen Triangle'=> 0.3
  },
  'Fallen Triangle'=> {
  'Downward Facing Dog'=> 0.4, 
  'Three-Legged Downward Facing Dog'=> 0.6
  },
  'Easy Pose'=> {
  'Hero'=> 0.2,
  'Table Top'=> 0.1,
  'Plank'=> 0.1,
  'Squat'=> 0.3,
  'Forward Fold'=> 0.1,
  'Downward Facing Dog'=> 0.1,
  'Corpse'=> 0.1
  },
  'Ragdoll'=> {

  }
}




File.open('Backbend_model.yml', 'w') { |file| file.write(model.to_yaml) }