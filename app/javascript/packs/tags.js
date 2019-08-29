const tagsMultiSelect = function() {
  const tagsSelector = document.querySelector("#new_post_tags");
  const postAssociationField = document.querySelector("#post_tag_ids");
  if(tagsSelector != null && postAssociationField != null) {
    const slimSelect = new SlimSelect({
      select: '#new_post_tags'
    });
    tagsSelector.addEventListener('change', function(e) {
      e.preventDefault();
      e.stopPropagation();
      console.log(slimSelect.selected());
      postAssociationField.value = slimSelect.selected();
    });
  }
}
module.exports = tagsMultiSelect;

