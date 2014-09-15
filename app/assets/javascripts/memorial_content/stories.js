$(document).ready(function(){

  var maxStoryLength = 500;
  var addStoryButton = $('#add-story-button');
  var charCount = $('#story-char-count');
  var addStoryInput = $('#add-story-input');

  charCount.html(maxStoryLength);

  addStoryInput.bind('keyup', function(){
      checkCharCount($(this), maxStoryLength, charCount, addStoryButton);
  });



});