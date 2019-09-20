const tagsMultiSelect = function(currentTags) {
  const tagsSelector = document.querySelector("#new_post_tags");
  const postAssociationField = document.querySelector("#post_tag_ids");
  if(tagsSelector != null && postAssociationField != null) {
    const choices = new Choices('#new_post_tags', {
      removeItemButton: true,
      placeholder: true,
      placeholderValue: "Enter tag name",
    });
    setSavedTags(currentTags, choices);
    tagsSelector.addEventListener('change', function(e) {
      e.preventDefault();
      e.stopPropagation();
      const ids = choices.getValue().map( tag => parseInt(tag.value));
      postAssociationField.value = ids;
    });
  }
}

const setSavedTags = function(currentTags, choices) {
  if(currentTags != null) {
    choices.setValue(currentTags);
  }
}


module.exports = tagsMultiSelect;

