const multiSelect = function() {
  const categoriesSelector = document.querySelector("#new_post_categories");
  const postAssociationField = document.querySelector("#post_category_ids");
  if(categoriesSelector != null && postAssociationField != null) {
    const choices = new Choices('#new_post_categories',{
      removeItemButton: true 
    });
    categoriesSelector.addEventListener('change', function(e) {
      e.preventDefault();
      e.stopPropagation();
      // console.log(choices.selected());
      // postAssociationField.value = choices.selected();
    });
  }
}
module.exports = multiSelect;

