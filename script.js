$(document).ready(function() {
  var intervalInc = 0;

  var poseArray = JSON.parse(data);
  var imageArray = JSON.parse(images);


  // ######### Hash an array for testing loadimages function for slideshow ########
  // var yogaArray = ['Warrior1', 'Warrior2', 'Warrior3', 'Triangle',
  //                  'Warrior1', 'Warrior2', 'Warrior3', 'Triangle',
  //                  'Warrior1', 'Warrior2', 'Warrior3', 'Triangle',
  //                  'Warrior1', 'Warrior2', 'Warrior3', 'Triangle',]
  // var hash = {
  //   Warrior1: {image: '/images/beach-yoga.jpg'},
  //   Warrior2: {image: '/images/Creative-yoga-and-sunset-vector-03.jpg'},
  //   Warrior3: {image: '/images/yoga-tree.jpg'},
  //   Triangle: {image: '/images/yoga.jpg'}
  // };

  $('input.checkbox').on('change', function() {
    $('input.checkbox').not(this).prop('checked', false);  
  });
  
  $('#userStart').on('change', function() {
    if ($('#userStart').val() == "1") {
      $('#userStartTextbox').val('Seated');
    }
    else {
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
    $('.select start').toggleClass('hidden');
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
  };

  function activateOverlay(){
    startSlideShow();
    overlayActive = true;
    $('#bgDimmer').addClass('overlay');
    setTimeout(function(){
      $('#slideshow').addClass('modal');
      $('#close-overlay').removeClass('hidden')
      toggleMainPage();
    }, 200);
  };

  $('#overlay-button').on('click', activateOverlay);  
  $('#close-overlay').on('click', removeOverlay);
  $('#bgDimmer').on('click', removeOverlay);

  function loadSlides(){
    // The next step is to iterate through an array to find the proper pose name, and then match that with 
    // the hash to retrieve the correlating image url for that array element.
    for (var i = 0; i < poseArray.length; i++)
    {
      for(var poseInt = 0; poseInt < imageArray.length; poseInt++)
      {
        var pose = Object.keys(imageArray[poseInt])[0];
        var poseURL = imageArray[poseInt][pose];
        if(poseArray[i] == pose)
          {
            $('#slideshow').append('<img class="nextSlide" src=' + poseURL + '>');
          };
      }
    };
  };

  function removeLastSlide(){
    var lastSlide = $('img').last().detach();
    lastSlide.removeClass();
    lastSlide.prependTo('#slideshow').addClass('nextSlide')
  }

  function startSlideShow(){  
    loadSlides();
    setTimeout(function(){
      $('img').eq(0).addClass('futureSlide');
      $('img').eq(0).removeClass('nextSlide');
      window.slideInterval = setInterval(function(){
        var totalImages = $('#slideshow img').siblings('img').size();
        if(intervalInc > 0)
        {
          $('img').eq(intervalInc - 1).addClass('pastSlide');
          $('img').eq(intervalInc - 1).removeClass('activeSlide');
        }
        if(intervalInc == totalImages || intervalInc > 1)
        {
          $('img').eq(intervalInc - 2).addClass('nextSlide');
        }
        $('img').eq(intervalInc).addClass('activeSlide');
        $('img').eq(intervalInc).removeClass('futureSlide');
        $('img').eq(intervalInc + 1).addClass('futureSlide');
        $('img').eq(intervalInc + 1).removeClass('nextSlide');
        if(intervalInc <= totalImages)
        {
          intervalInc++;
        }
      }, 2000);
    }, 1000);
  };

});

