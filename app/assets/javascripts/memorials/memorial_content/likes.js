$(document).ready(function(){

  var $favoriteButton = $('.favorite');
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
      element.find('.favorite').hide();
    } else {
      element.find('.favorite').show();
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
    $(this).parents('li').find('.favorite').hide();

    var storyID = $(this).parents('.card').attr('data-id');
    var contentType = $(this).parents('.card').attr('data-type');

    postLike(storyID, contentType);
    changeLikeCount($(this), "UP");

    if ( $(this).parents('.card').attr('data-like-count') == "0" ){
//      debugger;
      if ( containsDelete($(this).parents('.card')) ){
        console.log("CONTAINS DELETE");
        var deleteOption = $(this).parents('.card').find('.crud-actions');
        console.dir(deleteOption);
        $('<li></li>').html('1').addClass('like-count').insertBefore(deleteOption);
        $(this).parents('.card').attr('data-like-count','1');
      } else {
        console.log("DOESNT CONTAIN DELETE")
        $(this).parents('ul').append($('<li></li>').html('1').addClass('like-count'));
        $(this).parents('.card').attr('data-like-count','1');
      }
    }

  });

  $deleteFavorite.bind('click', function(e){
    e.preventDefault();

    $(this).parents('li').find('.unlike').hide();
    $(this).parents('li').find('.favorite').show();

    var storyID = $(this).parents('.card').attr('data-id');
    var contentType = $(this).parents('.card').attr('data-type');

    deleteLike(storyID, contentType);
    changeLikeCount($(this), "DOWN");

    if ( $(this).parents('.card').find('.like-count').html() == "0" ){
      $(this).parents('.card').find('.like-count').remove();
      $(this).parents('.card').attr('data-like-count','0');
    }
  });

  var containsDelete = function(card){
    var deleteOption = card.find(".delete-card")
    return deleteOption.length > 0
  }

});