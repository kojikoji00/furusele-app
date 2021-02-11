// import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  $('#history_category_id').change(function() {
    let categoryParentId = $(this).val();
    debugger
    $('.category-child').append(
      // `<%= f.collection_select :category_id, CategoryDetail.where(category_id: categoryParentId), :id, :name %>`
      `<%= f.collection_select :category_id, @category_detail.where(category_id: categoryParentId), :id, :name %>`
      // `<%= f.collection_select :category_id, options_from_collection_for_select(@category_list, :id, :name) %>`
    )
  })
});