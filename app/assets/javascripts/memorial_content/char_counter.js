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
