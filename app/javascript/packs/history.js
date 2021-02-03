// import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  $('#history_category_id').change(function() {
    let categoryParentId = $(this).val();
    debugger
    $('.category-child').append(
      `<%= f.collection_select :category_id, CategoryDetail.where(category_id: categoryParentId), :id, :name %>`
    )
  })
});