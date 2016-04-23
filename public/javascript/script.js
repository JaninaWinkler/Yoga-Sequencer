$(document).ready(function() {

  // $('#rateYo').css('visibility', 'none');

  var intervalInc = 0;
  var imageArray = JSON.parse(images);
  var totalImages = $('#slideshow img').siblings('img').size();


  $('#post_sequence').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: '/generate',
      method: 'post',
      data: $('input').serialize(),
      success: function(){
      }
    });
  });

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
    intervalInc = 0;
    $('#rateYo').rateYo('destroy');
  };

  function activateOverlay(){
    startSlideShow();
    overlayActive = true;
    $('#bgDimmer').addClass('overlay');
    setTimeout(function(){
      $('#slideshow').addClass('modal');
      $('#close-overlay').removeClass('hidden');
      toggleMainPage();
    }, 200);
  };

  $('#overlay-button').on('click', activateOverlay);  
  $('#close-overlay').on('click', removeOverlay);
  $('#bgDimmer').on('click', removeOverlay);

  function loadSlides(){
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
                  $('#slideshow').append('<img class="nextSlide" src=' + poseURL + '>');
              }
            }
          }
              $('img').eq(0).addClass('futureSlide');
          $('img').eq(0).removeClass('nextSlide');
        }
      });
    }, 1000);
  };

  function removeLastSlide(){
    var lastSlide = $('img').last().detach();
    lastSlide.removeClass();
    lastSlide.prependTo('#slideshow').addClass('nextSlide')
  }

  function startSlideShow(){  
    loadSlides();
    setTimeout(function(){
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
        if($('#slideshow img').siblings('img').last()[0].className.includes('pastSlide') /*&& $('#rateYo').siblings().size() < 2*/){
          $('#rateYo').rateYo({
            rating: 0,
            fullStar: true
          })
        }
      }, 2000);
    }, 2000);
  };
});

