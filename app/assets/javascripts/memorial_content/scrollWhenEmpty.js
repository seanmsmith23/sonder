$(document).ready(function(){
  var newStory = $('#new-story-button');
  var newImage = $('#new-image-button');
  var newPost = $('#new-post-button');

  newStory.click(function(){
    $("html, body").animate({ scrollTop: $(newStory).offset().top }, 1000);
  });

  newImage.click(function(){
    $("html, body").animate({ scrollTop: $(newImage).offset().top }, 1000);
  });

  newPost.click(function(){
    $("html, body").animate({ scrollTop: $(newPost).offset().top }, 1000);
  });

});