function MoveCards(cards){

  this.cards = cards;
  this.count = this.cards.length;

  this.threeColumns = function(index, element) {
    if (index % 3 == 0) {
      $('.three-column-one').append(element);
    }
    else if (index % 3 == 1) {
      $('.three-column-two').append(element);
    }
    else if (index % 3 == 2) {
      $('.three-column-three').append(element);
    }
  };

  this.twoColumns = function(index, element) {
    if (index % 2 == 0) {
      $('.two-column-one').append(element);
    }
    else if (index % 2 == 1) {
      $('.two-column-two').append(element);
    }
  };

  this.oneColumn = function(index, element) {
    $('.one-column-one').append(element)
  };

  this.one = function(){
    this.cards.each(this.oneColumn);
  };

  this.two = function(){
    this.cards.each(this.twoColumns);
  };

  this.three = function(){
    this.cards.each(this.threeColumns);
  };
}