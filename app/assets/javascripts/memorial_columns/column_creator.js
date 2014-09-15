$(document).ready(function(){

  var windowWidth = $(window).innerWidth();
  var currentColumns = 4;
  var cards = $('.card');
  var cardMover = new MoveCards(cards);

  var divMaker = function(columnClass){
    if(columnClass == 1){
      $('<div></div>').addClass('one-column').prependTo('.columns-container');
      $('<div></div>').addClass('one-column-one').appendTo('.one-column');
    }
    else if (columnClass == 2) {
      $('<div></div>').addClass('two-columns').prependTo('.columns-container');
      $('<div></div>').addClass('two-column-one').appendTo('.two-columns');
      $('<div></div>').addClass('two-column-two').appendTo('.two-columns');
    }
    else if (columnClass == 3) {
      $('<div></div>').addClass('three-columns').prependTo('.columns-container');
      $('<div></div>').addClass('three-column-one').appendTo('.three-columns');
      $('<div></div>').addClass('three-column-two').appendTo('.three-columns');
      $('<div></div>').addClass('three-column-three').appendTo('.three-columns');
    }
  };


  var renderColumns = function(width){
    if (width <= 710 && currentColumns != 1) {
      divMaker(1);

      cardMover.one();
      currentColumns = 1;

      $('.three-columns').remove();
      $('.two-columns').remove();
    }
    else if (width > 710 && width <= 1150 && currentColumns != 2) {
      divMaker(2);

      cardMover.two();
      currentColumns = 2;

      $('.one-column').remove();
      $('.three-columns').remove();

    }
    else if (width > 1150 && currentColumns != 3){
      divMaker(3);

      cardMover.three();
      currentColumns = 3;

      $('.two-columns').remove();
      $('.one-column').remove();
    }
  };

  renderColumns(windowWidth);

  $(window).resize(function(){
    var windowWidth = $(window).innerWidth();
    renderColumns(windowWidth);
  });
});