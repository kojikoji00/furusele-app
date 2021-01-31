// import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  // $('.category-parent').change(function() {
  $('#history_category_id').change(function() {
    let categoryParentId = $(this).val();
    // var selectCategoryId = $(this).attr('id');
    debugger
    // $('.category-child').append(
    $('.category-child').append(
      // `<%= f.collection_select :category_id, CategoryDetail.where(category_id: selctCategoryId), :id, :name %>`
      // `<%= f.collection_select :category_id, CategoryDetail.where(category_id: categoryParentId), :id, :name %>`
      `<%= f.collection_select :category_id, CategoryDetail.where(category_id: categoryParentId), :id, :name %>`
    )
  })
});