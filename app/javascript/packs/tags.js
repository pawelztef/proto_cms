const tagsMultiSelect = function(currentTags) {
  const tagsSelector = document.querySelector("#new_post_tags");
  const postAssociationField = document.querySelector("#post_tag_ids");
  if(tagsSelector != null && postAssociationField != null) {
    const choices = new Choices('#new_post_tags', {
      removeItemButton: true 
    });
    setSavedTags(currentTags, choices);
    tagsSelector.addEventListener('change', function(e) {
      e.preventDefault();
      e.stopPropagation();
      const x = choices.getValue().map( tag => tag.id );
      postAssociationField.value = x;
    });
  }
}

const setSavedTags = function(currentTags, choices) {
  if(currentTags != null) {
    console.log('inside' + currentTags);
    choices.setValue(currentTags);
  }
}


module.exports = tagsMultiSelect;

