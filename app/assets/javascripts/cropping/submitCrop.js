$(document).ready(function(){
  var cropButton = $('.crop-button');

  cropButton.click(function(e){
    e.preventDefault();
    var x = $('#image_crop_x').val();
    var y = $('#image_crop_y').val();
    var w = $('#image_crop_w').val();
    var h = $('#image_crop_h').val();

    var cropImageContainer = $(this).parents('.crop-image-container');

    debugger;

    var imageId = cropImageContainer.attr('data-image-id');
    var memorialId = cropImageContainer.attr('data-memorial-id');

    var url = "/memorials/" + memorialId + "/crop/" + imageId;
    var params = {
      image:{
        crop_x: x,
        crop_y: y,
        crop_w: w,
        crop_h: h
      }
    };

    $.ajax({
      type: "PATCH",
      url: url,
      data: params,
      success: function(){
        alert("YAAAAY");
      },
      errors: function(){
        alert("NOOOOO");
      }
    })
  });
});