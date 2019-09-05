const tagsMultiSelect = function(currentTags) {
  const tagsSelector = document.querySelector("#new_post_tags");
  const postAssociationField = document.querySelector("#post_tag_ids");
  if(tagsSelector != null && postAssociationField != null) {
    const slimSelect = new SlimSelect({
      select: '#new_post_tags',
      selected: true
    });
    setSavedTags(currentTags, slimSelect);
    tagsSelector.addEventListener('change', function(e) {
      e.preventDefault();
      e.stopPropagation();
      console.log(slimSelect.selected());
      postAssociationField.value = slimSelect.selected();
    });
  }
}

const setSavedTags = function(currentTags, slimSelect) {
  if(currentTags != null) {
    console.log('inside');
    console.log(currentTags);
    // slimSelect.setData(currentTags);
  }
}


module.exports = tagsMultiSelect;

