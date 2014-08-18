$('document').ready(function(){

  $('#sign-in-form').hide();

  $('#sign-in-button').on('click', function(){
    $('#sign-in-form').show();
    $('#sign-in-button').hide();
    $('#registration-form').hide();
    $('#signed-up').hide();
  });

  $('#register-button').on('click', function(){
    $('#sign-in-form').hide();
    $('#sign-in-button').show();
    $('#registration-form').show();
    $('#signed-up').show();
  });

});


