$(document).ready(function() {

  $(document.body).fadeIn(3000);

  var intervalInc = 0;
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

  // $('#get-rating-selector').rateYo({
  //   rating: 5, 
  //   fullStar: true
  // });

  $('input.checkbox').on('change', function() {
    $('input.checkbox').not(this).prop('checked', false);  
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
      $('#userTimeTextbox').val('A bit..');
    }
    else if ($('#userTime').val() == "3") {
      $('#userTimeTextbox').val('Tons!');
    }
    else {
      $('#userTimeTextbox').val('A fair amount.');
    }
  });
  function toggleMainPage(){
    $('.select').toggleClass('hidden');
    $('.select time').toggleClass('hidden');
    $('.select energy').toggleClass('hidden');
    $('.select goal').toggleClass('hidden');
    $('#header').toggleClass('hidden');
  };

  function removeOverlay(){
    overlayActive= false;
    clearInterval(slideInterval);
    $('#bgDimmer').removeClass('overlay');
    $('#slideshow').removeClass('modal');
    $('#close-overlay').addClass('hidden');
    toggleMainPage();
    $('#slideshow img').remove();
    $('#rateYo').rateYo('destroy');
    $('#rate-sequence-button').addClass('hidden');
    $('#rate-sequence').addClass('hidden');
    intervalInc = 0;
  };

  function activateOverlay(loadslides){
    startSlideShow(loadslides);
    overlayActive = true;
    $('#bgDimmer').addClass('overlay');
    setTimeout(function(){
      $('#slideshow').addClass('modal');
      $('#close-overlay').removeClass('hidden')
      toggleMainPage();
    }, 200);
  };

  $('#random-rated-sequence').on('click', function(){
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
        error: function(){
        },
        success: function(data){
          var poseArray = JSON.parse(data);
          for (var i = 0; i < poseArray.length; i++){
            for(var poseInt = 0; poseInt < imageArray.length; poseInt++){
              var pose = Object.keys(imageArray[poseInt])[0];
              var poseURL = imageArray[poseInt][pose];
              if(poseArray[i] == pose){
                  $('#slideshow').append('<img class="nextSlide" src=' + poseURL + '>');
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

  function startSlideShow(loadslides){  
    var rated = false;
    $('#slideshow img').remove();
    loadslides;
    setTimeout(function(){
      if($('#slideshow')[0].className.includes('modal')){
        window.slideInterval = setInterval(function(){
          totalImages = $('#slideshow img').siblings('img').size();
          if(intervalInc > 0){
            $('img').eq(intervalInc - 1).addClass('pastSlide');
            $('img').eq(intervalInc - 1).removeClass('activeSlide');
          }
          if(intervalInc == totalImages || intervalInc > 1){
            $('img').eq(intervalInc - 2).addClass('nextSlide');
          }
          $('img').eq(intervalInc).addClass('activeSlide');
          $('img').eq(intervalInc).removeClass('futureSlide');
          $('img').eq(intervalInc + 1).addClass('futureSlide');
          $('img').eq(intervalInc + 1).removeClass('nextSlide');
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
                  fullStar: true
                })
                rated = true;
              }
            }, 3000);
          }
        }, 2000);
      }
    }, 2000);
  };

});


      $.ajax({
        url: '/rating',
        method: 'get',
        success: function(){
        }
        });