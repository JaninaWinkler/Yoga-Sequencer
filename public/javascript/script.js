$(document).ready(function() {

  $(document.body).fadeIn(3000);

  var imageArray = JSON.parse(images);

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
    $('#fullpage').toggleClass('hidden', 'slow');
    // $('.ft-tableCell').toggleClass('hidden');
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
    var intervalInc = 0;
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

});
