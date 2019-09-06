const multiSelect = function(currentCategories) {
  const categoriesSelector = document.querySelector("#new_post_categories");
  const postAssociationField = document.querySelector("#post_category_ids");
  if(categoriesSelector != null && postAssociationField != null) {
    const choices = new Choices('#new_post_categories',{
      removeItemButton: true,
      placeholder: true,
      placeholderValue: "Enter category name",
    });
    setSavedCategories(currentCategories, choices);
    categoriesSelector.addEventListener('change', function(e) {
      e.preventDefault();
      e.stopPropagation();
      const ids = choices.getValue().map( category => parseInt(category.value));
      postAssociationField.value = ids;
    });
  }
}
const setSavedCategories = function(currentCategories, choices) {
  if(currentCategories != null) {
    choices.setValue(currentCategories);
  }
}
module.exports = multiSelect;

