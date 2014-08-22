$(document).ready(function(){

  var maxLength = 500;
  var $charCount = $('#comment-char-count');
  var $addCommentButton = $('#add-comment-button');

  $charCount.html(maxLength);

  $('#add-comment-input').bind('keyup', function(){

    var charsTyped = $(this).val().length;
    $charCount.html(maxLength - charsTyped);

    if (charsTyped > maxLength){
      $charCount.addClass('over-limit');
      $addCommentButton.prop("disabled", true);
    }
    else {
      $charCount.removeClass('over-limit');
      $addCommentButton.removeAttr("disabled");
    }

  });

});