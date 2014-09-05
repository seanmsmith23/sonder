$(document).ready(function(){

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

  var buttonClickedColor = function(button){
    button.toggleClass('clicked-button');
  };

  var clearButtonColor = function(buttons){
    buttons.removeClass('clicked-button');
  };

  var postAndImageForms =  newPostForm.add();
  var storyAndImageForms = newStoryForm.add();

  var postAndImageButtons = newPostButton.add();
  var storyAndImageButtons = newStoryButton.add();

  newStoryButton.click(function(){
    clearButtonColor(postAndImageButtons);
    hideAndShow(newStoryForm, postAndImageForms);
    buttonClickedColor(newStoryButton);
  });

  newPostButton.click(function(){
    clearButtonColor(storyAndImageButtons);
    hideAndShow(newPostForm, storyAndImageForms);
    buttonClickedColor(newPostButton);
  });

});