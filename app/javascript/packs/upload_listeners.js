let customUploadButton = function(hiddenButton, customButton, metaInfoContainer) {
  let avatarRealInput = hiddenButton;
  let avatarCustomUploadButton = customButton;
  let avatarCustomMetaInfo = metaInfoContainer;

  if(avatarCustomUploadButton != null) {
    avatarCustomUploadButton.addEventListener("click", function(e) {
      e.preventDefault();
      e.stopPropagation();
      avatarRealInput.click();
    });
  }
  if(avatarRealInput != null) {
    avatarRealInput.addEventListener("change", function(e) {
      e.preventDefault();
      e.stopPropagation();
      avatarCustomMetaInfo.innerHTML = avatarRealInput.files[0].name;
    });
  }
}

module.exports = customUploadButton;
