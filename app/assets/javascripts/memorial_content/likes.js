$(document).ready(function(){

  var $favoriteButton = $('.story-favorite');
  var $deleteFavorite = $('.unlike');

  var postLike = function(storyID, contentType){
    $.ajax({
      type: "POST",
      url: "/likes",
      data: {
        content_id: storyID,
        content_type: contentType
      }
    });
  };

  var deleteLike = function(storyID, contentType){
    $.ajax({
      type: "DELETE",
      url: "/likes",
      data: {
        content_id: storyID,
        content_type: contentType
      }
    });
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

  var checkForLikes = function(element){
    if ( element.find('#liked').size() > 0 ){
      element.find('.story-favorite').hide();
    } else {
      element.find('.story-favorite').show();
      element.find('.unlike').hide();
    }

    if ( element.find('.like-count').attr('data-likes') == "0" ){
      element.find('.like-count').remove();
    }
  };

  $('.card').each(function(){
    checkForLikes($(this));
  });

  $favoriteButton.bind('click', function(e){
    e.preventDefault();

    $(this).parents('li').find('.unlike').show();
    $(this).parents('li').find('.story-favorite').hide();

    var storyID = $(this).parents('.card').attr('data-id');
    var contentType = $(this).parents('.card').attr('data-type');

    postLike(storyID, contentType);
    changeLikeCount($(this), "UP");

    if ( $(this).parents('.card').attr('data-like-count') == "0" ){
      $(this).parents('ul').append($('<li></li>').html('1').addClass('like-count'));
      $(this).parents('.card').attr('data-like-count','1');
    }

  });

  $deleteFavorite.bind('click', function(e){
    e.preventDefault();

    $(this).parents('li').find('.unlike').hide();
    $(this).parents('li').find('.story-favorite').show();

    var storyID = $(this).parents('.card').attr('data-id');
    var contentType = $(this).parents('.card').attr('data-type');

    deleteLike(storyID, contentType);
    changeLikeCount($(this), "DOWN");

    if ( $(this).parents('.card').find('.like-count').html() == "0" ){
      $(this).parents('.card').find('.like-count').remove();
      $(this).parents('.card').attr('data-like-count','0');
    }
  });


});