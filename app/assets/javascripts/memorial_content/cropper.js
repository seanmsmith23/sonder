$(document).ready(function(){

  $('#hello').click(function(){
    alert('hello');
  });

  var AvatarCropper,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  jQuery(function() {
    return new AvatarCropper();
  });

  AvatarCropper = (function() {
    function AvatarCropper() {
      this.update = __bind(this.update, this);
      $('#cropbox').Jcrop({
        aspectRatio: (16/10),
        onSelect: this.update,
        onChange: this.update
      });
    }

    AvatarCropper.prototype.update = function(coords) {
      $('#image_crop_x').val(coords.x);
      $('#image_crop_y').val(coords.y);
      $('#image_crop_w').val(coords.w);
      $('#image_crop_h').val(coords.h);
    };

    return AvatarCropper;

  })();


});