$(document).ready(function(){
  var coverPhoto = $('.memorial-cover-photo');
  coverPhoto.imagefill();

  $('.new_story').hide();

  $('#new-story-button').click(function(){
    $('.new_story').show();
  });

});