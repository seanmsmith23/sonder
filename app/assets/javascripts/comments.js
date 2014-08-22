$(document).ready(function(){

  var maxLength = 500;
  var $charCount = $('#comment-char-count');
  var $addCommentButton = $('#add-comment-button');
  var $favoriteButton = $('.comment-favorite');

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

  $favoriteButton.bind('click', function(e){
    e.preventDefault();

    var $likeCount = $(this).parents('.card').find('.like-count');
    var likes = parseInt( $likeCount.html() );

    $likeCount.html(likes + 1);

    $(this).prop("disabled", true);

    var likeData = $(this).parents('.card').attr('data-id');

    $.ajax({
      type: "POST",
      url: "/likes",
      data: {id: likeData},
      success: function(){

      },
      error: function(){
        alert('failure')
      }
    });
  });

});