require 'yaml'
require 'json'

model =   {
  'Warrior 1'=> {
    'Warrior 2'=> 0.3,
    'Warrior 3'=> 0.1,
    'Low Lunge' => 0.1,
    'Pyramid'=> 0.1,
    'Five-Pointed Star'=> 0.1,
    'Knee-To-Chest'=> 0.2,
    'Twisted Lunge'=> 0.1
  },
  'Warrior 2'=> {
    'Extended Side Angle'=> 0.2,
    'Triangle'=> 0.2,
    'Half Moon'=> 0.1,
    'Reverse Warrior'=> 0.1,
    'Five-Pointed Star'=> 0.2,
    'Goddess Squat'=> 0.1,
    'Reverse Triangle'=> 0.1
  },
  'Warrior 3'=> {
    'Standing Splits'=> 0.2,
    'Warrior 1'=> 0.2,
    'Low Lunge'=> 0.1,
    'Half Moon'=> 0.1,
    'High Lunge'=> 0.1,
    'Pyramid'=> 0.1,
    'Knee-To-Chest'=> 0.2
  },
  'Extended Side Angle'=> {
    'Warrior 2'=> 0.2,
    'Triangle'=> 0.1,
    'Half Moon'=> 0.2,
    'Wide-Legged Fold'=> 0.1,
    'Goddess Squat'=> 0.1,
    'Five-Pointed Star'=> 0.2,
    'Reverse Triangle'=> 0.1
  },
  'Reverse Warrior'=> {
    'Warrior 2'=> 0.2,
    'Extended Side Angle'=> 0.2,
    'Half Moon'=> 0.1,
    'Triangle'=> 0.1,
    'Reverse Triangle'=> 0.1,
    'Five-Pointed Star'=> 0.3
  }, 
  'High Lunge'=> {
    'Twisted Lunge'=> 0.2,
    'Warrior 2'=> 0.2,
    'Warrior 3'=> 0.1,
    'Five-Pointed Star'=> 0.1,
    'Low Lunge'=> 0.1,
    'Knee-To-Chest'=> 0.1,
    'Pyramid'=> 0.2
  },
  'Pyramid'=> {
    'Warrior 1'=> 0.2,
    'Triangle'=> 0.1,
    'Standing Splits'=> 0.2,
    'Wide-Legged Fold'=> 0.2,
    'Five-Pointed Star'=> 0.2,
    'Warrior 3'=> 0.1
  },
  'Twisted Lunge'=> {
    'High Lunge'=> 0.5,
    'Low Lunge'=> 0.2,
    'Warrior 1'=> 0.1,
    'Pyramid'=> 0.2
  },
  'Five-Pointed Star'=> {
    'Warrior 2'=> 0.2,
    'Triangle'=> 0.1,
    'Warrior 1' => 0.2,
    'Reverse Triangle'=>0.1,
    'Wide-Legged Fold'=> 0.2,
    'Goddess Squat'=> 0.2
  },
    'Wide-Legged Fold'=> {
    'Warrior 2'=> 0.1,
    'Warrior 1'=> 0.1,
    'Extended Side Angle' => 0.1,
    'Goddess Squat'=> 0.2,
    'Five-Pointed Star'=> 0.3,
    'Runners Lunge'=> 0.2
  },
    'Goddess Squat'=> {
    'Wide-Legged Fold'=> 0.2,
    'Extended Side Angle'=> 0.2,
    'Warrior 2'=> 0.2,
    'Triangle'=>0.1,
    'Five-Pointed Star'=> 0.3
  },
  'Standing Splits'=> {
    'Tree Pose'=> 0.1,
    'Warrior 3'=>0.3,
    'Warrior 1'=>0.2,
    'Low Lunge'=>0.2,
    'Knee-To-Chest'=> 0.2
  },
    'Tree Pose'=> {
    'Dancers Pose'=> 0.2,
    'Standing Splits'=> 0.1,
    'Warrior 3'=> 0.1,
    'Warrior 1'=> 0.1,
    'High Lunge'=>0.1,
    'Low Lunge'=>0.1,
    'Knee-To-Chest'=> 0.2,
    'Eagle'=> 0.1,
  },
    'Dancers Pose' => {
    'Tree Pose'=> 0.1,
    'Standing Splits'=> 0.1,
    'Warrior 1'=>0.1,
    'Low Lunge'=>0.1,
    'High Lunge'=>0.1,
    'Warrior 3'=> 0.1,
    'Knee-To-Chest'=> 0.2,
    'Eagle'=> 0.2, 
  },

  'Extended Hand-To-Big-Toe'=> {
    'Tree Pose'=> 0.2,
    'Standing Splits'=> 0.1,
    'Dancers Pose'=> 0.1,
    'Warrior 1'=>0.1,
    'Warrior 3'=> 0.1,
    'Low Lunge'=>0.1,
    'Knee-To-Chest'=> 0.2,
    'Eagle'=> 0.1
  },
  'Knee-To-Chest'=> {
    'Warrior 1'=> 0.1,
    'High Lunge'=> 0.1,
    'Tree Pose'=> 0.2,
    'Standing Splits'=> 0.1,
    'Dancers Pose'=> 0.1,
    'Warrior 1'=>0.1,
    'Warrior 3'=> 0.1,
    'Low Lunge'=>0.1,
    'Eagle'=> 0.1
  },

  'Eagle'=> {
    'Warrior 1'=> 0.2,
    'Tree Pose'=> 0.2,
    'Half Moon'=> 0.1,
    'Low Lunge'=> 0.1,
    'Knee-To-Chest'=> 0.3,
    'Pyramid'=> 0.1
  },   
    'Triangle'=> {
    'Half Moon'=> 0.3,
    'Wide-Legged Fold'=> 0.1,
    'Goddess Squat'=> 0.1,
    'Five-Pointed Star'=> 0.2,
    'Warrior 2'=> 0.2,
    'Reverse Triangle'=> 0.1
  },
    'Half Moon'=> {
    'Triangle'=> 0.2,
    'Standing Splits'=> 0.3,
    'Warrior 1'=> 0.2,
    'Low Lunge'=> 0.1,
    'High Lunge'=> 0.1,
    'Reverse Triangle'=> 0.1
  },
  'Reverse Triangle'=> {
    'Warrior 2'=> 0.3,
    'Triangle'=> 0.2,
    'Extended Side Angle'=> 0.2,
    'Five-Pointed Star'=> 0.3
  },
  'Runners Lunge'=> {
    'Sleeping Pigeon'=> 0.3,
    'Warrior 1'=> 0.3,
    'High Lunge'=> 0.2,
    'Wide-Legged Fold'=> 0.1,
    'Five-Pointed Star'=> 0.1
  },   
  'Sleeping Pigeon'=> {
    'Runners Lunge'=> 0.4,
    'Low Lunge'=> 0.3,
    'Head-To-Knee-Pose'=> 0.2,
    'Downward Dog'=> 0.1
  }, 
    'Low Lunge'=> {
    'Head-To-Knee-Pose' => 0.4,
    'Runners Lunge'=> 0.2,
    'Sleeping Pigeon'=> 0.2,
    'Warrior 3'=>0.1,
    'Warrior 1'=>0.1
  },
    'Head-To-Knee-Pose'=> {
    'Low Lunge' => 0.3,
    'Warrior 3' => 0.2, 
    'Sleeping Pigeon'=> 0.2,
    'Downward Dog'=> 0.3
  },
    'Downward Dog'=> {
    }
}
File.open('2_model.json', 'w') {|file| file.write(model.to_json)}
File.open('2_model.yml', 'w') { |file| file.write(model.to_yaml) }