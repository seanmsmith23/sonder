$(document).ready(function(){

  var maxLength = 500;
  var $charCount = $('#comment-char-count');
  var $addCommentButton = $('#add-comment-button');
  var $favoriteButton = $('.comment-favorite');
  var $deleteFavorite = $('.unlike');

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

  $('.card').each(function(){
    if ( $(this).find('#liked').size() > 0 ){
      $(this).find('.comment-favorite').hide();
    } else {
      $(this).find('.comment-favorite').show();
      $(this).find('.unlike').hide();
    }

    if ( $(this).find('.like-count').attr('data-likes') == "0" ){
      $(this).find('.like-count').remove();
    }
  });

  $favoriteButton.bind('click', function(e){
    e.preventDefault();

    var $likeCount = $(this).parents('.card').find('.like-count');
    var likes = parseInt( $likeCount.html() );
    $likeCount.html(likes + 1);

    $(this).parents('li').find('.unlike').show();
    $(this).parents('li').find('.comment-favorite').hide();

    var commentID = $(this).parents('.card').attr('data-id');
    var memorialID = $(this).parents('.card').attr('data-memorial-id');

    $.ajax({
      type: "POST",
      url: "/likes",
      data: {
        id: commentID,
        memorial_id: memorialID
      },
      success: function(){}
    });

    if ( $(this).parents('.card').attr('data-like-count') == "0" ){
      $(this).parents('ul').append($('<li></li>').html('1').addClass('like-count'));
      $(this).parents('.card').attr('data-like-count','1');

    }

  });

  $deleteFavorite.bind('click', function(e){
    e.preventDefault();

    var $likeCount = $(this).parents('.card').find('.like-count');
    var likes = parseInt( $likeCount.html() );
    $likeCount.html(likes - 1);

    $(this).parents('li').find('.unlike').hide();
    $(this).parents('li').find('.comment-favorite').show();

    var commentID = $(this).parents('.card').attr('data-id');
    var memorialID = $(this).parents('.card').attr('data-memorial-id');

    $.ajax({
      type: "DELETE",
      url: "/likes/" + commentID,
      success: function(){}
    });

    if ( $(this).parents('.card').attr('data-like-count') == "1" ){
      $(this).parents('.card').find('.like-count').remove();
      $(this).parents('.card').attr('data-like-count','0');
    }

  });

});