function Carousel(links, imageDisplay){
  this.links = links;
  this.imageDisplay = imageDisplay;
  this.currentImage = 0;
  this.numberOfImages = this.links.size();
}

Carousel.prototype.advanceCarousel = function(){
  if (this.numberOfImages == 1){
    this.displaySingleImage();
  } else {
    this.nextImage();
    this.displayCurrentImage();
  }
};

Carousel.prototype.reverseCarousel = function(){
  this.previousImage();
  this.displayCurrentImage();
};

Carousel.prototype.nextImage = function(){
  if (this.currentImage == (this.numberOfImages - 1)){
    this.currentImage = 0;
  } else {
    this.currentImage += 1;
  }
};

Carousel.prototype.previousImage = function(){
  if (this.currentImage == 0){
    this.currentImage = (this.numberOfImages - 1)
  } else {
    this.currentImage -= 1
  }
};

Carousel.prototype.displaySingleImage = function(){
  var link = this.links.html();

  this.imageDisplay.css('background-image', "url(" + link + ")");
};

Carousel.prototype.displayCurrentImage = function(){
  var link = $(this.links[this.currentImage]).html();

  this.imageDisplay.css('background-image', "url(" + link + ")");
};