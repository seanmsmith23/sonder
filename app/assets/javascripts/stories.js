$(document).ready(function(){

//  Manipulating Data

  var postLike = function(storyID, memorialID){
    $.ajax({
      type: "POST",
      url: "/likes",
      data: {
        id: storyID,
        memorial_id: memorialID
      }
    });
  };

  var deleteLike = function(storyID){
    $.ajax({
      type: "DELETE",
      url: "/likes/" + storyID
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


  var maxStoryLength = 500;
  var addStoryButton = $('#add-story-button');
  var $favoriteButton = $('.story-favorite');
  var $deleteFavorite = $('.unlike');
  var charCount = $('#story-char-count');
  var addStoryInput = $('#add-story-input');

  charCount.html(maxStoryLength);

  addStoryInput.bind('keyup', function(){
      checkCharCount($(this), maxStoryLength, charCount, addStoryButton);
  });

  $('.card').each(function(){
    checkForLikes($(this));
  });

  $favoriteButton.bind('click', function(e){
    e.preventDefault();

    $(this).parents('li').find('.unlike').show();
    $(this).parents('li').find('.story-favorite').hide();

    var storyID = $(this).parents('.card').attr('data-id');
    var memorialID = $(this).parents('.card').attr('data-memorial-id');

    postLike(storyID, memorialID);
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

    deleteLike(storyID);
    changeLikeCount($(this), "DOWN");

    if ( $(this).parents('.card').find('.like-count').html() == "0" ){
      $(this).parents('.card').find('.like-count').remove();
      $(this).parents('.card').attr('data-like-count','0');
    }
  });

});