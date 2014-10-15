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
    this.displayCurrentImage();
    this.nextImage();
  }
};

Carousel.prototype.reverseCarousel = function(){
  this.previousImage()
  this.displayCurrentImage()
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
  var imageString = this.links.html();
  var link = "http://localhost:3000" + imageString;

  this.imageDisplay.css('background-image', "url(" + link + ")");
};

Carousel.prototype.displayCurrentImage = function(){
  var imageString = $(this.links[this.currentImage]).html();
  var link = "http://localhost:3000" + imageString;

  this.imageDisplay.css('background-image', "url(" + link + ")");
};