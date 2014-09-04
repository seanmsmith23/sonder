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

//var checkCharCount = function(clicked, maxLength, charCountDOM, button){
//  charsTyped = clicked.val().length;
//  charCountDOM.html(maxLength - charsTyped);
//
//  if (charsTyped > maxLength){
//    charCountDOM.addClass('over-limit');
//    button.prop("disabled", true);
//  } else {
//    charCountDOM.removeClass('over-limit');
//    button.removeAttr("disabled");
//  }
//};
//
////addStoryInput.bind('keyup', function(){
////  checkCharCount($(this), maxStoryLength, charCount, addStoryButton);
////});