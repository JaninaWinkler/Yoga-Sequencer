require 'yaml'

model =   {
  'Squat'=> {
  'Bharadvajas Twist'=> 0.1,
  'Easy Pose'=> 0.3,
  'Ragdoll'=> 0.1,
  'Gate'=> 0.1,
  'Hero'=> 0.2,
  'Toes Pose'=> 0.1,
  'Heron'=> 0.1
  },
  'Bharadvajas Twist'=> {
  'Cow Face'=> 0.1,
  'Easy Pose'=> 0.1,
  'Fire Log'=> 0.1,
  'Gate'=> 0.1,
  'Head-to-knee Forward Bend'=> 0.05,
  'Hero'=> 0.1,
  'Toes Pose'=> 0.1,
  'Heron'=> 0.1,
  'Marichis Pose'=> 0.1,
  'Side-Reclining Leg Lift'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.05,
  },
  'Bound Angle'=> {
  'Bharadvajas Twist'=> 0.05,
  'Cow Face'=> 0.1, 
  'Easy Pose'=> 0.05,
  'Fire Log'=> 0.1,
  'Happy Baby'=> 0.05,
  'Head-to-knee Forward Bend'=> 0.1,
  'Hero'=> 0.1,
  'Reclining Bound Angle Pose'=> 0.1,
  'Lotus'=> 0.05,
  'Seated Forward Bend'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.1,
  'Corpse Pose'=> 0.1,
  },
  'Cow Face'=> {
  'Bharadvajas Twist'=> 0.1,
  'Bound Angle'=> 0.1,
  'Easy Pose'=> 0.1,
  'Gate'=> 0.05,
  'Head-to-knee Forward Bend'=> 0.05,
  'Toes Pose'=> 0.05, 
  'Marichis Pose'=> 0.1,
  'Reclining Hand-to-Big-Toe Pose'=> 0.05,
  'Seated Forward Bend'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.1,
  'Corpse Pose'=> 0.1,
  'Squat'=> 0.1 
  },
  'Easy Pose'=> {
  'Bound Angle'=> 0.1,
  'Cow Face'=> 0.1,
  'Fire Log'=> 0.1,
  'Head-to-knee Forward Bend'=> 0.1,
  'Hero'=> 0.1,
  'Lotus'=> 0.1,
  'Seated Forward Bend'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.1,
  'Corpse Pose'=> 0.1,
  'Ragdoll'=> 0.1,
  },
  'Fire Log'=> {
  'Bound Angle'=> 0.1,
  'Easy Pose'=> 0.1,
  'Fish'=> 0.1,
  'Head-to-knee Forward Bend'=> 0.1,
  'Hero'=> 0.1, 
  'Marichis Pose'=> 0.1,
  'Seated Forward Bend'=> 0.1,
  'Side-Reclining Leg Lift'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.1,
  'Corpse Pose'=> 0.1,
  },
  'Fish'=> {
  'Corpse Pose'=> 0.7,
  'Reclining Bound Angle Pose'=>0.2,
  'Happy Baby'=> 0.1
  }, 
  'Gate'=> {
  'Bharadvajas Twist'=> 0.2,
  'Head-to-knee Forward Bend'=> 0.1,
  'Hero'=> 0.2,
  'Toes Pose'=> 0.1,
  'Heron'=> 0.1,
  'Marichis Pose'=> 0.1,
  'Side-Reclining Leg Lift'=> 0.1,
  'Corpse Pose'=> 0.1
  },
  'Happy Baby'=> {
  'Easy Pose'=> 0.1,
  'Legs-up-the-wall'=> 0.2, 
  'Plow'=> 0.1,
  'Reclining Bound Angle Pose'=> 0.1,
  'Reclining Hand-to-Big-Toe Pose'=> 0.1,
  'Shoulder Stand'=> 0.1,
  'Supine Twist'=> 0.2,
  'Corpse Pose'=> 0.1
  },
  'Head-to-knee Forward Bend'=> {
  'Bharadvajas Twist'=> 0.2,
  'Bound Angle'=> 0.1,
  'Fire Log'=> 0.1,
  'Hero'=> 0.1,
  'Marichis Pose'=> 0.2,
  'Seated Forward Bend'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.1,
  'Corpse Pose'=> 0.1
  },
  'Hero'=> {
  'Bharadvajas Twist'=> 0.1,
  'Easy Pose'=> 0.1,
  'Gate'=> 0.3,
  'Heron'=> 0.2,
  'Side-Reclining Leg Lift'=> 0.1,
  'Ragdoll'=> 0.2,
  },
  'Toes Pose'=> {
  'Bharadvajas Twist'=> 0.3,
  'Gate'=> 0.2,
  'Hero'=> 0.4,
  'Ragdoll'=> 0.1
  },
  'Heron'=> {
  'Bharadvajas Twist'=> 0.2,
  'Cow Face'=> 0.2,
  'Easy Pose'=> 0.2,
  'Gate'=> 0.2,
  'Hero'=> 0.1,
  'Toes Pose'=> 0.1
  },
  'Legs-up-the-wall'=> {
  'Easy Pose'=> 0.1,
  'Happy Baby'=> 0.1,
  'Plow'=> 0.2,
  'Shoulder Stand'=> 0.3,
  'Supine Twist'=> 0.2,
  'Corpse Pose'=> 0.1
  },
  'Marichis Pose'=> {
  'Cow Face'=> 0.1,
  'Easy Pose'=> 0.1,
  'Fire Log'=> 0.1,
  'Head-to-knee Forward Bend'=> 0.2,
  'Hero'=> 0.1,
  'Seated Forward Bend'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.1,
  'Corpse Pose'=> 0.2
  },
  'Plow'=> {
  'Fish'=> 0.2, 
  'Legs-up-the-wall'=> 0.2,
  'Reclining Bound Angle Pose'=> 0.1,
  'Shoulder Stand'=> 0.2,
  'Corpse Pose'=> 0.3
  },
  'Reclining Bound Angle Pose'=> {
  'Bound Angle'=> 0.1,
  'Easy Pose'=> 0.1,
  'Fish'=> 0.1,
  'Happy Baby'=> 0.2,
  'Legs-up-the-wall'=> 0.1, 
  'Reclining Hand-to-Big-Toe Pose'=> 0.1,
  'Supine Twist'=> 0.1,
  'Corpse Pose'=> 0.2,
  }, 
  'Reclining Hand-to-Big-Toe Pose'=> {
  'Happy Baby'=> 0.2,
  'Legs-up-the-wall'=> 0.2, 
  'Reclining Bound Angle Pose'=> 0.2,
  'Supine Twist'=> 0.2,
  'Corpse Pose'=> 0.2
  },
  'Lotus'=> {
  'Bound Angle'=> 0.2,
  'Easy Pose'=> 0.5,
  'Seated Forward Bend'=> 0.2,
  'Corpse Pose'=> 0.1,
  },
  'Seated Forward Bend'=> {
  'Bharadvajas Twist'=> 0.05,
  'Bound Angle'=> 0.05,
  'Cow Face'=> 0.05,
  'Easy Pose'=> 0.1,
  'Fire Log'=> 0.05,
  'Head-to-knee Forward Bend'=> 0.05,
  'Hero'=> 0.1,
  'Toes Pose'=> 0.05, 
  'Marichis Pose'=> 0.05,
  'Plow'=> 0.1,
  'Lotus'=> 0.05,
  'Shoulder Stand'=> 0.1,
  'Wide-Angle Seated Fold'=> 0.1,
  'Corpse Pose'=> 0.1
  },
  'Side-Reclining Leg Lift'=> {
  'Bound Angle'=> 0.2,
  'Cow Face'=> 0.1,
  'Easy Pose'=> 0.2,
  'Fire Log'=> 0.1,
  'Head-to-knee Forward Bend'=> 0.2,
  'Marichis Pose'=> 0.2,
  },
  'Shoulder Stand'=> {
  'Fish'=> 1.0
  },
  'Wide-Angle Seated Fold'=> {
  'Bharadvajas Twist'=> 0.1,
  'Cow Face'=> 0.1,
  'Easy Pose'=> 0.1,
  'Fire Log'=> 0.1,
  'Head-to-knee Forward Bend'=> 0.2,
  'Seated Forward Bend'=> 0.3,
  'Corpse Pose'=> 0.1
  },
  'Supine Twist'=> {
  'Happy Baby'=> 0.3,
  'Legs-up-the-wall'=> 0.2, 
  'Reclining Bound Angle Pose'=> 0.1,
  'Seated Forward Bend'=> 0.1,
  'Marichis Pose'=> 0.1,
  'Corpse Pose'=> 0.2
  },
  'Corpse Pose'=> {
  'Fish'=> 0.1,
  'Happy Baby'=> 0.2,
  'Legs-up-the-wall'=> 0.2, 
  'Plow'=> 0.1,
  'Reclining Bound Angle Pose'=> 0.1,
  'Reclining Hand-to-Big-Toe Pose'=> 0.1,
  'Shoulder Stand'=> 0.1,
  'Supine Twist'=> 0.1
  },
  'Ragdoll'=> {

  }
}

File.open('Seated_model.yml', 'w') { |file| file.write(model.to_yaml) }