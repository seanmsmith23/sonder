$(document).ready(function(){
  var coverPhoto = $('.memorial-cover-photo');
  coverPhoto.imagefill();

  var newStoryForm = $('.new_story');
  var newStoryButton = $('#new-story-button');

  var newPostForm = $('.new_post');
  var newPostButton = $('#new-post-button');

  var hideForms = function(){
    newPostForm.hide();
    newStoryForm.hide();
  };

  hideForms();

  var hideAndShow = function(toggle, hide){
    toggle.toggle();
    hide.hide();
  };

  var postAndImage =  newPostForm.add();
  var storyAndImage = newStoryForm.add();

  newStoryButton.click(function(){
    hideAndShow(newStoryForm, postAndImage);
  });

  newPostButton.click(function(){
    hideAndShow(newPostForm, storyAndImage);
  });

});