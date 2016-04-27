$(document).ready(function() {

  $(document.body).fadeIn(3000);

  // var imageArray = JSON.parse(images);

  $('#post_sequence ').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: '/generate',
      method: 'post',
      data: $('input').serialize(),
      success: function(){
      }
    });
  });

  $('#rate-sequence-button').on('click', function(){
    $.ajax({
      url: '/rating',
      method: 'post',
      data: $('#rate-sequence-button')[0].name + "=" + $('#rateYo').rateYo('rating'),
      success: function(){
        removeOverlay();
      }
    });
  });

$('.arrowUp').click(function(){
    $.fn.fullpage.moveSectionUp();
});

$('.arrowDown').click(function(){
    $.fn.fullpage.moveSectionDown();
});

  $('input.checkbox').on('change', function() {
    $('input.checkbox').not(this).prop('checked', false);  
  });
  
  $('label.focus-label').on('change', function() {
    $(this).addClass('clicked');  
    $('label.focus-label').not(this).removeClass('clicked');  
  });

  $('#userStart').on('change', function() {
    if ($('#userStart').val() == "1") {
      $('#userStartTextbox').val('Seated');
    }
    else if ($('#userStart').val() == "2") {
      $('#userStartTextbox').val('Standing');
    }
  });
  
  $('#userTime').on('change', function() {
    if ($('#userTime').val() == "1") {
      $('#userTimeTextbox').val('A bit');
    }
    else if ($('#userTime').val() == "3") {
      $('#userTimeTextbox').val('Tons');
    }
    else {
      $('#userTimeTextbox').val('A fair amount');
    }
  });
  function toggleMainPage(){
    $('#fullpage').toggleClass('hidden');
  };

  function removeOverlay(){
    clearInterval(slideInterval);
    $('#bgDimmer').removeClass('overlay');
    $('#slideshow').removeClass('modal');
    $('#close-overlay').addClass('hidden');
    toggleMainPage();
    $('#slideshow img').remove();
    $('#slideshow .pose-name').remove();
    $('#rateYo').rateYo('destroy');
    $('#rate-sequence-title').addClass('hidden');
    $('#rate-sequence-container').addClass('hidden');
    $('#rate-sequence-button').addClass('hidden');
    $('#rate-sequence').addClass('hidden');
  };

  function activateOverlay(loadslides){
    startSlideShow(loadslides);
    $('#bgDimmer').addClass('overlay');
    setTimeout(function(){
      $('#slideshow').addClass('modal');
      $('#close-overlay').removeClass('hidden')
      toggleMainPage();
    }, 200);
  };

  $('#top-rated-button').on('click', function(){
   activateOverlay(loadSlidesRandom());
  });
  $('#overlay-button').on('click', function(){
   activateOverlay(loadSlidesChosen());  
  });
  $('#close-overlay').on('click', removeOverlay);
  $('#bgDimmer').on('click', removeOverlay);

  function loadSlidesRandom(){
    setTimeout(function(){
      $.ajax({
        url: '/rating',
        method: 'get',
        success: function(data){
          var poseArray = JSON.parse(data);
          for (var i = 0; i < poseArray.length; i++){
            for(var poseInt = 0; poseInt < imageArray.length; poseInt++){
              var pose = Object.keys(imageArray[poseInt])[0];
              var poseURL = imageArray[poseInt][pose];
              if(poseArray[i] == pose){
                $('#slideshow').append('<img class="nextSlide" src=' + poseURL + '>');
                $('#slideshow').append('<div class="pose-name hidden"><label>' + pose + '</label></div>');
              }
            }
          }
          if($('#slideshow')[0].className.includes('modal')){
            $('img').eq(0).addClass('futureSlide');
            $('img').eq(0).removeClass('nextSlide');
          }
        }
      });
    }, 1000);
  };

  function loadSlidesChosen(){
    setTimeout(function(){
      $.ajax({
        url: '/generate',
        method: 'get',
        success: function(data){
          var poseArray = JSON.parse(data);
          for (var i = 0; i < poseArray.length; i++){
            for(var poseInt = 0; poseInt < imageArray.length; poseInt++){
              var pose = Object.keys(imageArray[poseInt])[0];
              var poseURL = imageArray[poseInt][pose];
              if(poseArray[i] == pose){
                if($('#slideshow')[0].className.includes('modal')){
                  $('#slideshow').append('<img class="nextSlide" src=' + poseURL + '>');
                  $('#slideshow').append('<div class="pose-name hidden"><label>' + pose + '</label></div>');
                }
              }
            }
          }
            $('img').eq(0).addClass('futureSlide');
            $('img').eq(0).removeClass('nextSlide');
        }
      });
    }, 1000);
  };

  function startSlideShow(loadslides){  
    var intervalInc = 0
    var rated = false;
    $('#slideshow img').remove();
    $('#slideshow .pose-name').remove();
    loadslides;
    setTimeout(function(){
      if($('#slideshow')[0].className.includes('modal')){
        window.slideInterval = setInterval(function(){
          totalImages = $('#slideshow img').siblings('img').size();
          if(intervalInc > 0){
            $('img').eq(intervalInc - 1).addClass('pastSlide');
            $('img').eq(intervalInc - 1).removeClass('activeSlide');
            $('.pose-name').eq(intervalInc - 1).addClass('hidden');
          }
          if(intervalInc == totalImages || intervalInc > 1){
            $('img').eq(intervalInc - 2).addClass('nextSlide');
          }
          $('img').eq(intervalInc).addClass('activeSlide');
          $('img').eq(intervalInc).removeClass('futureSlide');
          $('img').eq(intervalInc + 1).addClass('futureSlide');
          $('img').eq(intervalInc + 1).removeClass('nextSlide');
          $('.pose-name').eq(intervalInc).removeClass('hidden');
          if(intervalInc <= totalImages){
            intervalInc++;
          }
          if($('#slideshow img').siblings('img').last()[0].className.includes('pastSlide') && rated === false){
            setTimeout(function(){
              if($('#slideshow')[0].className.includes('modal')){
                $('#rate-sequence-button').removeClass('hidden');
                $('#slideshow label').removeClass('hidden');
                $('#rateYo').rateYo({
                  rating: 0,
                  fullStar: true,
                  ratedFill: "#064E75",
                  starWidth: "40px"
                })
                rated = true;
              }
            }, 3000);
          }
        }, 2000);
      }
    }, 1000);
  };

  $('#sound-button').on('click', function(){
    $('#soundcloud-container').animate({
      right: "toggle"
    }, 'fast');
    if($('#sound-button')[0].className.includes("soundcloud-offscreen")){
      $('#sound-button').toggleClass('soundcloud-offscreen');
    }
    else{
      setTimeout(function(){
        $('#sound-button').toggleClass('soundcloud-offscreen');
      }, 250);
    }
  });

var imageArray = [{"Mountain": "/images/yoga_for_app/Mountain.jpg"}, {"Warrior 1": "/images/yoga_for_app/Warrior_1.jpg"}, {"Warrior 2": "/images/yoga_for_app/Warrior_2.jpg"}, {"Warrior 3": "/images/yoga_for_app/Warrior_3.jpg"}, {"Extended Side Angle": "/images/yoga_for_app/Extended_Side_Angle.jpg"}, {"Reverse Warrior": "/images/yoga_for_app/Reverse_Warrior.jpg"}, {"High Lunge": "/images/yoga_for_app/High_Lunge.jpg"}, {"Pyramid": "/images/yoga_for_app/Pyramid.jpg"}, {"Twisted Lunge": "/images/yoga_for_app/Twisted_Lunge.jpg"}, {"Five-Pointed Star": "/images/yoga_for_app/Five-Pointed_Star.jpg"}, {"Wide-Legged Fold": "/images/yoga_for_app/Wide-Legged_Fold.jpg"}, {"Goddess Squat": "/images/yoga_for_app/Goddess_Squat.jpg"}, {"Standing Splits": "/images/yoga_for_app/Standing_Splits.jpg"}, {"Tree Pose": "/images/yoga_for_app/Tree_Pose.jpg"}, {"Dancers Pose": "/images/yoga_for_app/Dancers_Pose.jpg"}, {"Extended Hand-To-Big-Toe": "/images/yoga_for_app/Extended_Hand-To-Big-Toe.jpg"}, {"Knee-To-Chest": "/images/yoga_for_app/Knee-To-Chest.jpg"}, {"Eagle": "/images/yoga_for_app/Eagle.jpg"}, {"Triangle": "/images/yoga_for_app/Triangle.jpg"}, {"Half Moon": "/images/yoga_for_app/Half_Moon.jpg"}, {"Reverse Triangle": "/images/yoga_for_app/Reverse_Triangle.jpg"}, {"Runners Lunge": "/images/yoga_for_app/Runners_Lunge.jpg"}, {"Sleeping Pigeon": "/images/yoga_for_app/Sleeping_Pigeon.jpg"}, {"Low Lunge": "/images/yoga_for_app/Low_Lunge.jpg"}, {"Head-To-Knee-Pose": "/images/yoga_for_app/Head-To-Knee-Pose.jpg"}, {"Downward Facing Dog": "/images/yoga_for_app/Downward_Facing_Dog.jpg"}, {"Bharadvajas Twist": "/images/yoga_for_app/Bharadvajas_Twist.jpg"}, {"Bound Angle": "/images/yoga_for_app/Bound_Angle.jpg"}, {"Cow Face": "/images/yoga_for_app/Cow_Face.jpg"}, {"Easy Pose": "/images/yoga_for_app/Easy_Pose.jpg"}, {"Fire Log": "/images/yoga_for_app/Fire_Log.jpg"}, {"Fish": "/images/yoga_for_app/Fish.jpg"}, {"Gate": "/images/yoga_for_app/Gate.jpg"}, {"Happy Baby": "/images/yoga_for_app/Happy_Baby.jpg"}, {"Head-to-knee Forward Bend": "/images/yoga_for_app/Head-to-knee_Forward_Bend.jpg"}, {"Hero": "/images/yoga_for_app/Hero.jpg"}, {"Toes Pose": "/images/yoga_for_app/Toes_Pose.jpg"}, {"Heron": "/images/yoga_for_app/Heron.jpg"}, {"Legs-Up-The-Wall": "/images/yoga_for_app/Legs-Up-The-Wall.jpg"}, {"Marichis Pose": "/images/yoga_for_app/Marichis_Pose.jpg"}, {"Plow": "/images/yoga_for_app/Plow.jpg"}, {"Reclining Hand-to-Big-Toe Pose": "/images/yoga_for_app/Reclining_Hand-to-Big-Toe_Pose.jpg"}, {"Lotus": "/images/yoga_for_app/Lotus.jpg"}, {"Seated Forward Bend": "/images/yoga_for_app/Seated_Forward_Bend.jpg"}, {"Side-Reclining Leg Lift": "/images/yoga_for_app/Side-Reclining_Leg_Lift.jpg"}, {"Shoulder Stand": "/images/yoga_for_app/Shoulder_Stand.jpg"}, {"Wide-Angle Seated Fold": "/images/yoga_for_app/Wide-Angle_Seated_Fold.jpg"}, {"Supine Twist": "/images/yoga_for_app/Supine_Twist.jpg"}, {"Corpse Pose": "/images/yoga_for_app/Corpse_Pose.jpg"}, {"Seated Meditation": "/images/yoga_for_app/Seated_Meditation.jpg"}, {"Boat": "/images/yoga_for_app/Boat.jpg"}, {"Dolphin": "/images/yoga_for_app/Dolphin.jpg"}, {"Plank": "/images/yoga_for_app/Plank.jpg"}, {"Four-Limb_Staff": "/images/yoga_for_app/Four-Limb_Staff.jpg"}, {"Headstand": "/images/yoga_for_app/Headstand.jpg"}, {"Upward Plank": "/images/yoga_for_app/Upward_Plank.jpg"}, {"Reclined knee-to-chest": "/images/yoga_for_app/Reclined_knee-to-chest.jpg"}, {"Table Top": "/images/yoga_for_app/Table_Top.jpg"}, {"Chair": "/images/yoga_for_app/Chair.jpg"}, {"Crow": "/images/yoga_for_app/Crow.jpg"}, {"Knee-to-Arm Plank": "/images/yoga_for_app/Knee-to-Arm_Plank.jpg"}, {"Arm-Balance Split": "/images/yoga_for_app/Arm-Balance_Split.jpg"}, {"Corpse": "/images/yoga_for_app/Corpse.jpg"}, {"Childs Pose": "/images/yoga_for_app/Childs_Pose.jpg"}, {"Forward Fold": "/images/yoga_for_app/Forward_Fold.jpg"}, {"Wheel": "/images/yoga_for_app/Wheel.jpg"}, {"Bridge": "/images/yoga_for_app/Bridge.jpg"}, {"Camel": "/images/yoga_for_app/Camel.jpg"}, {"Reclining Hero Pose": "/images/yoga_for_app/Reclining_Hero_Pose.jpg"}, {"Cobra": "/images/yoga_for_app/Cobra.jpg"}, {"Extended Puppy Dog": "/images/yoga_for_app/Extended_Puppy_Dog.jpg"}, {"Cat": "/images/yoga_for_app/Cat.jpg"}, {"Cow": "/images/yoga_for_app/Cow.jpg"}, {"Lie on Stomach": "/images/yoga_for_app/Lie_on_Stomach.jpg"}, {"Locust": "/images/yoga_for_app/Locust.jpg"}, {"Bow": "/images/yoga_for_app/Bow.jpg"}, {"Sphinx": "/images/yoga_for_app/Sphinx.jpg"}, {"Squat": "/images/yoga_for_app/Squat.jpg"}, {"Standing Backbend": "/images/yoga_for_app/Standing_Backbend.jpg"}, {"Wild Thing": "/images/yoga_for_app/Wild_Thing.jpg"}, {"Three-Legged Downward Facing Dog": "/images/yoga_for_app/Three-Legged_Downward_Facing_Dog.jpg"}, {"Fallen Triangle": "/images/yoga_for_app/Fallen_Triangle.jpg"}, {"Reclining Bound Angle Pose": "/images/yoga_for_app/Reclining_Bound_Angle_Pose.jpg"}, {"Final Downward Facing Dog": "/images/yoga_for_app/Final_Downward_Facing_Dog.jpg"}, {"Ragdoll": "/images/yoga_for_app/Ragdoll.jpg"}, {"Stand at Top of Mat": "/images/yoga_for_app/Stand_at_Top_of_Mat.jpg"}, {"Step to Lunge": "/images/yoga_for_app/Step_to_Lunge.jpg"}, {"Samasthitihi": "/images/yoga_for_app/Samasthitihi.jpg"}, {"Upward Salute": "/images/yoga_for_app/Upward_Salute.jpg"}, {"Handstand": "/images/yoga_for_app/Handstand.jpg"}, {"Float to Top of Mat": "/images/yoga_for_app/Float_to_Top_of_Mat.jpg"}, {"Upward Facing Dog": "/images/yoga_for_app/Upward_Facing_Dog.jpg"}, {"Big Toe Pose": "/images/yoga_for_app/Big_Toe_Pose.jpg"}, {"Halfway Lift": "/images/yoga_for_app/Halfway_Lift.jpg"}, {"Hands On Hips": "/images/yoga_for_app/Hands_On_Hips.jpg"}, {"Savasana": "/images/yoga_for_app/Corpse.jpg"}, {"Transition to Top of Mat": "/images/yoga_for_app/Transition_to_Top_of_Mat.jpg"}, {"Staff": "/images/yoga_for_app/Staff.jpg"}]


});
