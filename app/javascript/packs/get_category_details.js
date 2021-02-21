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
  $('select[name="category_detail_id"]').change(function() {
    var categoryDetailId = $('select[name="category_detail_id"] option:selected').attr("value");
    var selectCategoryDetail = gon.category_details.filter( cat => cat.id == Number(categoryDetailId));
    // $('#file-btn').click(function(){
    //   $.ajax({
    //     type: "post",
    //     url: "/categories/new",
    //     dataType: "json",
    //     data: {
    //       id: $(selectCategoryDetail).attr('id')
    //     },
    //     timeout: 10000,
    //     success: function(data) {
    //       alert("success");
    //     },
    //     error: function(data) {
    //       debugger
    //       alert("error");
    //     }
    //   })
    // })
  })
})
