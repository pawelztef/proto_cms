const multiSelect = function() {
  const categoriesSelector = document.querySelector("#new_post_categories");
  const postAssociationField = document.querySelector("#post_category_ids");
  const slimSelect = new SlimSelect({
    select: '#new_post_categories'
  });
  if(categoriesSelector != null && postAssociationField != null) {
    categoriesSelector.addEventListener('change', function(e) {
      e.preventDefault();
      e.stopPropagation();
      console.log(slimSelect.selected());
      postAssociationField.value = slimSelect.selected();
    });
  }
}
module.exports = multiSelect;

