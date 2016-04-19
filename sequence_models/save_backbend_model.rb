require 'yaml'

model = {

  'Wheel'=> {
  'Corpse'=> 0.3,
  'Bridge'=> 0.2,
  'Reclining Bound Angle Pose'=> 0.4,
  'Seated Meditation'=> 0.1
  },
  'Bridge'=> {
  'Wheel'=> 0.2,
  'Corpse'=> 0.3,
  'Reclining Bound Angle Pose'=> 0.4,
  'Seated Meditation'=> 0.1,
  },
  'Camel'=> {
  'Hero'=> 0.4, 
  'Reclining Hero Pose'=> 0.2,
  'Table Top'=> 0.2,
  'Easy Pose'=> 0.1,
  'Seated Meditation'=> 0.1
  },
  'Hero'=> {
  'Camel'=> 0.3,
  'Reclining Hero Pose'=> 0.3,
  'Forward Fold' => 0.2,
  'Easy Pose'=> 0.1,
  'Seated Meditation'=> 0.1
  },
  'Reclining Hero Pose'=> {
  'Hero'=> 0.6,
  'Easy Pose'=> 0.2,
  'Table Top'=> 0.2,
  },
  'Cobra'=> {
  'Table Top'=> 0.2,
  'Downward Dog'=> 0.2,
  'Plank'=> 0.2,
  'Lie on Stomach'=> 0.4
  },
  'Extended Puppy Dog'=> {
  'Table Top'=> 0.4,
  'Downward Dog'=> 0.3,
  'Plank'=> 0.2,
  'Seated Meditation'=> 0.1
  },
  'Table Top'=> {
  'Camel'=> 0.1,
  'Hero'=> 0.1, 
  'Extended Puppy Dog'=> 0.1,
  'Cat'=> 0.1,
  'Cow'=> 0.1,
  'Downward Dog'=> 0.2,
  'Plank'=> 0.1,
  'Easy Pose'=> 0.1,
  'Seated Meditation'=> 0.1
  },
  'Cat'=> {
  'Hero'=> 0.3,
  'Table Top'=> 0.3,
  'Cow'=> 0.4
  },
  'Cow'=> {
  'Table Top'=> 0.3,
  'Cat'=> 0.4,
  'Extended Puppy Dog'=> 0.3, 
  },
  'Downward Dog'=> {
  'Extended Puppy Dog'=> 0.1,
  'Table Top'=> 0.1,
  'Plank'=> 0.2,
  'Forward Fold'=> 0.2,
  'Three-Legged Downward Facing Dog'=> 0.2, 
  'Easy Pose'=> 0.1, 
  'Seated Meditation'=> 0.1
  }, 
  'Plank'=> {
  'Table Top'=> 0.2,
  'Downward Dog'=> 0.2,
  'Lie on Stomach'=> 0.6,
  },
  'Lie on Stomach'=> {
  'Cobra'=> 0.2,
  'Table Top'=> 0.1,
  'Plank'=> 0.1,
  'Locust'=> 0.2,
  'Bow'=> 0.2,
  'Sphinx'=> 0.2,
  },
  'Locust'=> {
  'Lie on Stomach'=> 0.8,
  'Bow'=> 0.2
  },
  'Bow'=> {
  'Lie on Stomach'=> 1.0
  },
  'Corpse'=> {
  'Wheel'=> 0.2,
  'Bridge'=> 0.2, 
  'Lie on Stomach'=> 0.1,
  'Fish'=> 0.2,
  'Easy Pose'=> 0.1,
  'Reclining Bound Angle Pose'=> 0.1,
  'Seated Meditation'=> 0.1
  },
  'Sphinx'=> {
  'Lie on Stomach'=> 0.7,
  'Locust'=> 0.3,
  },
  'Fish'=> {
  'Corpse'=> 1.0
  },
  'Forward Fold' => {
  'Table Top'=> 0.1,
  'Downward Dog'=> 0.1,
  'Plank'=> 0.1,
  'Squat'=> 0.2,
  'Standing Backbend' => 0.3,
  'Easy Pose'=> 0.1,
  'Seated Meditation'=> 0.1  
  },
  'Squat'=> {
  'Hero'=> 0.2,
  'Table Top'=> 0.1,
  'Downward Dog'=> 0.1,
  'Plank'=> 0.1,
  'Corpse'=> 0.1,
  'Forward Fold' => 0.2,
  'Easy Pose'=> 0.1,
  'Seated Meditation'=> 0.1
  },
  'Standing Backbend' => {
  'Forward Fold' => 0.7,
  'Squat'=> 0.3
  },
  'Wild Thing'=> {
  'Wheel'=> 0.3,
  'Downward Dog'=> 0.3,
  'Three-Legged Downward Facing Dog'=> 0.4,
  },
  'Three-Legged Downward Facing Dog'=> {
  'Downward Dog'=> 0.4, 
  'Wild Thing'=> 0.3,
  'Fallen Triangle'=> 0.3
  },
  'Fallen Triangle'=> {
  'Downward Dog'=> 0.4, 
  'Three-Legged Downward Facing Dog'=> 0.6
  },
  'Easy Pose'=> {
    'Hero'=> 0.1,
    'Table Top'=> 0.1,
    'Plank'=> 0.1,
    'Squat'=> 0.2,
    'Forward Fold'=> 0.1,
    'Downward Dog'=> 0.1,
    'Corpse'=> 0.1,
    'Lie on Stomach'=> 0.1,
    'Seated Meditation'=> 0.1
  },
  'Reclining Bound Angle Pose'=> {
    'Easy Pose'=> 0.2,
    'Seated Meditation'=> 0.2,
    'Wheel'=> 0.2,
    'Bridge'=> 0.2,
    'Corpse'=> 0.2,
  },
  'Seated Meditation'=> {

  }
}




File.open('6_model.yml', 'w') { |file| file.write(model.to_yaml) }