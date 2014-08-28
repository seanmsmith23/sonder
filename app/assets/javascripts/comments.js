$(document).ready(function(){

//  Manipulating Data

  var postLike = function(commentID, memorialID){
    $.ajax({
      type: "POST",
      url: "/likes",
      data: {
        id: commentID,
        memorial_id: memorialID
      }
    });
  };

  var deleteLike = function(commentID){
    $.ajax({
      type: "DELETE",
      url: "/likes/" + commentID
    });
  };

//  User interaction

//  Changing the DOM

  var checkCharCount = function(clicked, maxLength, charCountDOM, button){
    charsTyped = clicked.val().length;
    charCountDOM.html(maxLength - charsTyped);

    if (charsTyped > maxLength){
      charCountDOM.addClass('over-limit');
      button.prop("disabled", true);
    } else {
      charCountDOM.removeClass('over-limit');
      button.removeAttr("disabled");
    }
  };

  var changeLikeCount = function(clicked, upOrDown){
    var likeCount = clicked.parents('.card').find('.like-count');
    var likes = parseInt( likeCount.html() );
    if (upOrDown == "UP"){
      likeCount.html(likes + 1);
    }
    else if (upOrDown == "DOWN") {
      likeCount.html(likes - 1);
    }
  };

  var maxCommentLength = 500;
  var addCommentButton = $('#add-comment-button');
  var $favoriteButton = $('.comment-favorite');
  var $deleteFavorite = $('.unlike');
  var charCount = $('#comment-char-count');
  var addCommentInput = $('#add-comment-input');

  charCount.html(maxCommentLength);

  addCommentInput.bind('keyup', function(){
      checkCharCount($(this), maxCommentLength, charCount, addCommentButton);
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

    $(this).parents('li').find('.unlike').show();
    $(this).parents('li').find('.comment-favorite').hide();

    var commentID = $(this).parents('.card').attr('data-id');
    var memorialID = $(this).parents('.card').attr('data-memorial-id');

    postLike(commentID, memorialID);
    changeLikeCount($(this), "UP");

    if ( $(this).parents('.card').attr('data-like-count') == "0" ){
      $(this).parents('ul').append($('<li></li>').html('1').addClass('like-count'));
      $(this).parents('.card').attr('data-like-count','1');
    }

  });

  $deleteFavorite.bind('click', function(e){
    e.preventDefault();

    $(this).parents('li').find('.unlike').hide();
    $(this).parents('li').find('.comment-favorite').show();

    var commentID = $(this).parents('.card').attr('data-id');
    var memorialID = $(this).parents('.card').attr('data-memorial-id');

    deleteLike(commentID);
    changeLikeCount($(this), "DOWN");


    if ( $(this).parents('.card').find('.like-count').html() == "0" ){
      $(this).parents('.card').find('.like-count').remove();
      $(this).parents('.card').attr('data-like-count','0');
    }

  });

});