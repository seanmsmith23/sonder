var checkCharCount = function(fieldToCheck, maxLength, charCountDOM, button){
  charsTyped = fieldToCheck.val().length;
  charCountDOM.html(maxLength - charsTyped);

  if (charsTyped > maxLength){
    charCountDOM.addClass('over-limit');
    button.prop("disabled", true);
    fieldToCheck.addClass('error-in-field');
  } else {
    charCountDOM.removeClass('over-limit');
    button.removeAttr("disabled");
    fieldToCheck.removeClass('error-in-field');
  }
};
