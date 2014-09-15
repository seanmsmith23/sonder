$(document).ready(function(){
  var image = $('.card-image');

  var checkModal = function(imageClicked){
    imageClicked.parents('.card').find('.modal-state').prop('checked', true);
  };

  image.click(function(){
    checkModal($(this));
  });
});