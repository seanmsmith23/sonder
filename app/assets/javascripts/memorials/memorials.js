$(document).ready(function(){

//  FORM-BUTTONS

  var newStoryForm = $('.new_story');
  var newStoryButton = $('#new-story-button');

  var newPostForm = $('.new_post');
  var newPostButton = $('#new-post-button');

  var newImageForm = $('.new_image');
  var newImageButton = $('#new-image-button');

  var hideForms = function(){
    newPostForm.hide();
    newStoryForm.hide();
    newImageForm.hide();
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

  var postAndImageForms =  newPostForm.add(newImageForm);
  var storyAndImageForms = newStoryForm.add(newImageForm);
  var postAndStoryForms = newStoryForm.add(newPostForm);

  var postAndImageButtons = newPostButton.add(newImageButton);
  var storyAndImageButtons = newStoryButton.add(newImageButton);
  var postAndStoryButtons = newStoryButton.add(newPostButton);

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

  newImageButton.click(function(){
    clearButtonColor(postAndStoryButtons);
    hideAndShow(newImageForm, postAndStoryForms);
    buttonClickedColor(newImageButton);
  });

//  CAROUSEL

  var advanceAtIntervals = function(carousel, intervalSeconds){
    window.setInterval(function(){
      carousel.advanceCarousel();
    }, intervalSeconds * 1000);
  };

  var links = $('.image-string');
  var imageDisplay = $('.memorial-cover-photo');

  var carousel = new Carousel(links, imageDisplay);

  if (links.length > 0){
    carousel.advanceCarousel();
    advanceAtIntervals(carousel, 9);
  }

  $('.previous-image').click(function(){
    carousel.reverseCarousel();
  });

  $('.next-image').click(function(){
    carousel.advanceCarousel();
  });

});