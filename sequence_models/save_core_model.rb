require 'yaml'

model = {
  'Boat'=> {
  'Shoulder Stand'=> 0.1,
  'Table Top'=> 0.1,
  'Corpse'=> 0.2,
  'Easy Pose'=> 0.3,
  'Reclined knee-to-chest'=> 0.1,
  'Forward Fold'=> 0.1,
  'Plow'=> 0.1,
  },
  'Plow'=> {
  'Shoulder Stand'=> 0.2,
  'Upward Plank'=> 0.2,
  'Corpse'=> 0.2,
  'Bridge'=> 0.2,
  'Easy Pose'=> 0.1,
  'Reclined knee-to-chest'=> 0.1
  },
  'Dolphin'=> {
  'Downward Dog'=> 0.2,
  'Plank'=> 0.1,
  'Headstand'=> 0.3,
  'Table Top'=> 0.2,
  'Childs Pose'=> 0.2,
  },
  'Downward Dog'=> {
  'Dolphin'=> 0.1,
  'Plank'=> 0.3,
  'Table Top'=> 0.2,
  'Three-Legged Downward Facing Dog'=> 0.2,
  'Forward Fold'=> 0.1,
  'Childs Pose'=> 0.1,
  },
  'Plank'=> {
  'Dolphin'=> 0.2,
  'Downward Dog'=> 0.2,
  'Four-Limb Staff'=> 0.2,
  'Table Top'=> 0.2,
  'Knee-to-Arm Plank'=> 0.2,
  },
  'Four-Limb Staff'=> {
  'Plank'=> 1.0
  },
  'Headstand'=> {
  'Childs Pose'=> 0.6,
  'Downward Dog'=> 0.1, 
  'Plank'=> 0.1,
  'Table Top'=> 0.1,
  'Easy Pose'=> 0.1
  },
  'Shoulder Stand'=> {
  'Fish'=> 0.4,
  'Corpse'=> 0.3,
  'Plow'=> 0.3
  },
  'Upward Plank'=> {
  'Boat'=> 0.3,
  'Corpse'=> 0.3,
  'Easy Pose'=> 0.3,
  'Reclined knee-to-chest'=> 0.1
  },
  'Reclined knee-to-chest'=> {
  'Boat'=> 0.2,
  'Upward Plank'=> 0.2,
  'Corpse'=> 0.3,
  'Bridge'=> 0.1,
  'Easy Pose'=> 0.2,
  },
  'Table Top'=> {
  'Dolphin'=> 0.2,
  'Downward Dog'=> 0.2, 
  'Plank'=> 0.2,
  'Headstand'=> 0.1,
  'Cat'=> 0.2,
  'Easy Pose'=> 0.1
  }, 
  'Cat'=> {
  'Downward Dog'=> 0.5,
  'Table Top'=> 0.5,
  },
  'Chair'=> {
  'Warrior 3'=> 0.4,
  'Forward Fold'=> 0.6
  },
  'Warrior 3'=> {
  'Forward Fold'=> 0.6,
  'Chair'=> 0.4
  },
  'Crow'=> {
  'Downward Dog'=> 0.3, 
  'Plank'=> 0.3,
  'Forward Fold'=> 0.4    
  },
  'Three-Legged Downward Facing Dog'=> {
  'Downward Dog'=> 0.5,
  'Knee-to-Arm Plank'=> 0.5
  },
  'Knee-to-Arm Plank'=> {
  'Plank'=> 0.3,
  'Four-Limb Staff'=> 0.1,
  'Three-Legged Downward Facing Dog'=> 0.3,
  'Arm-Balance Split'=> 0.3,
  },
  'Arm-Balance Split'=> {
  'Downward Dog'=> 0.2,
  'Plank'=> 0.2,
  'Three-Legged Downward Facing Dog'=> 0.3,
  'Knee-to-Arm Plank'=> 0.3,
  },
  'Corpse'=> {
  'Boat'=> 0.1,
  'Shoulder Stand'=> 0.2,
  'Upward Plank'=> 0.1,
  'Bridge'=> 0.1,
  'Easy Pose'=> 0.1,
  'Reclined knee-to-chest'=> 0.1,
  'Plow'=> 0.2,
  'Fish'=> 0.1
  },
  'Bridge'=> {
  'Boat'=> 0.1,
  'Shoulder Stand'=> 0.1,
  'Upward Plank'=> 0.2,
  'Corpse'=> 0.2,
  'Reclined knee-to-chest'=> 0.1,
  'Plow'=> 0.1,
  'Fish'=> 0.2,
  },
  'Childs Pose'=> {
  'Dolphin'=> 0.2,
  'Downward Dog'=> 0.2, 
  'Plank'=> 0.1,
  'Four-Limb Staff'=> 0.1,
  'Headstand'=> 0.1,
  'Table Top'=> 0.1,
  'Cat'=> 0.1,
  'Easy Pose'=> 0.1
  },
  'Fish'=> {
  'Upward Plank'=> 0.1,
  'Corpse'=> 0.2,
  'Bridge'=> 0.1,
  'Easy Pose'=> 0.2,
  'Reclined knee-to-chest'=> 0.3,
  'Plow'=> 0.1,
  },
  'Forward Fold' => {
  'Downward Dog'=> 0.1,
  'Plank'=> 0.1,
  'Chair'=> 0.2,
  'Warrior 3'=> 0.2,
  'Crow'=> 0.2,
  'Easy Pose'=> 0.2,
  },
  'Easy Pose'=> {

  }
}




File.open('5_model.yml', 'w') { |file| file.write(model.to_yaml) }