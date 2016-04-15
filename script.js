$(document).ready(function() {

$('input.checkbox').on('change', function() {

    $('input.checkbox').not(this).prop('checked', false);  
});

$('#userEnergy').on('change', function() {
  if ($('#userEnergy').val() == "1") {
    $('#userEnergyTextbox').val('Turtle');
  }
  else if ($('#userEnergy').val() == "3") {
    $('#userEnergyTextbox').val('Stallion');
  }
  else {
    $('#userEnergyTextbox').val('Puppy');
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

$('#overlay-button').on('click', function(){
  $('#bgDimmer').addClass('overlay');
  setTimeout(function(){
    $('#popup').addClass('modal');
    $('#close-overlay').removeClass('hidden')
    $('.select-time').addClass('hidden')
    $('.select-energy').addClass('hidden')
    $('.select-goal').addClass('hidden')
    $('#header').addClass('hidden')
  },500);
});
  
$('#close-overlay').on('click', function(){
  $('#bgDimmer').removeClass('overlay');
  $('#popup').removeClass('modal')
  $('#close-overlay').addClass('hidden');
  $('.select-time').removeClass('hidden')
  $('.select-energy').removeClass('hidden')
  $('.select-goal').removeClass('hidden')
  $('#header').removeClass('hidden')
});

});