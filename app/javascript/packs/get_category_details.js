// import $ from 'jquery'

$(function() {
	$('select[name="category_id"]').change(function() {
    var categoryId = $('select[name="category_id"] option:selected').attr("value");
    var categoryDetails = gon.category_details.filter( cat => cat.category_id == categoryId );
    var count =  $('select[name="category_detail_id"]').children().length;
    for (var i=0; i<count; i++) {
      var categoryDetail = $('select[name="category_detail_id"] option:eq(' + i + ')');
      var a = gon.category_details.filter( cat => cat.id == Number(categoryDetail.attr('value')));
      if($(a).attr('category_id') === $(categoryDetails).attr("category_id")){
        categoryDetail.show();
      }else{
        if(categoryDetail.attr("value") === "msg"){
          categoryDetail.show();
          categoryDetail.prop('selected', true);
        }else{
          categoryDetail.hide();
        }
      }
    }
	})
})
// var categoryDetail = []
// $.each(categoryDetails, function(){
//   categoryDetail.push($(this));
// });

// document.addEventListener('DOMContentLoaded', () => {

//   // $('#category_id').change(function() {
//   //   $.get({
//   //     url: "#{new_category_path}",
//   //     data: {category_id: $('#category_id').has('option:selected').val() }
//   //   });
//   //   var count = $('#category_detail_id').children().length;
//   //   for(var)

//     // debugger
//     // $('#category_detail_id').html('<%= j(options_from_collection_for_select(@category_details.pluck(:id, :name))) %>');
//   });

// });
//   //   debugger
//   //   const categoryParentId = $(this).val();
//   //   // const words = @catergories
//   //   // debugger
//   //   // const result = words.filter(word => word.id == categoryParentId);
//   //   $('.category-child').append(
//   //     // `<%= f.collection_select :category_id, CategoryDetail.where(category_id: categoryParentId), :id, :name %>`
//   //     `<%= f.collection_select :category_id, @category_detail.where(category_id: categoryParentId), :id, :name %>`
//       // `<%= f.collection_select :category_id, options_from_collection_for_select(@category_list, :id, :name) %>`
