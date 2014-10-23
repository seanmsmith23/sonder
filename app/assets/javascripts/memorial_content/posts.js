$(document).ready(function(){
  var addPostButton = $('#add-post-button');
  var maxPostLength = 2000;
  var charCounter = $('#post-char-count');
  var postInputField = $('#add-post-input');

  charCounter.html(maxPostLength);

  postInputField.bind('keyup', function(){
    checkCharCount(postInputField, maxPostLength, charCounter, addPostButton);
  });

});
