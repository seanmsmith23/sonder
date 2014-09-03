$(document).ready(function(){
  var coverPhoto = $('.memorial-cover-photo');
  coverPhoto.imagefill();

  var newStoryForm = $('.new_story');
  var newStoryButton = $('#new-story-button');

  newStoryForm.hide();

  newStoryButton.click(function(){
    newStoryForm.toggle();
  });

});