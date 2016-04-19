$(document).ready(function() {
 var intervalInc = 0;

 var yogaArray = ['Warrior1', 'Warrior2', 'Warrior3', 'Triangle',
                  'Warrior1', 'Warrior2', 'Warrior3', 'Triangle',
                  'Warrior1', 'Warrior2', 'Warrior3', 'Triangle',
                  'Warrior1', 'Warrior2', 'Warrior3', 'Triangle',]

 var hash = {
   Warrior1: {image: 'beach-yoga.jpg'},
   Warrior2: {image: 'Creative-yoga-and-sunset-vector-03.jpg'},
   Warrior3: {image: 'yoga-tree.jpg'},
   Triangle: {image: 'yoga.jpg'}
 };

 $('input.checkbox').on('change', function() {
   $('input.checkbox').not(this).prop('checked', false);  
 });
 
 $('#userStart').on('change', function() {
   if ($('#userStart').val() == "2") {
     $('#userStartTextbox').val('Standing');
   }
   else {
     $('#userStartTextbox').val('Seated');
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
   $('.select-time').toggleClass('hidden');
   $('.select-start').toggleClass('hidden');
   $('.select-goal').toggleClass('hidden');
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
   for (var i = 0; i < yogaArray.length; i++)
   {
     for(var pose in hash)
     {
       if(yogaArray[i] == pose)
         {
           $('#slideshow').append('<img class="nextSlide" src=' + hash[pose]['image'] + '>');
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
   // loadSlides();
   // loadSlides();
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

