// import $ from 'jquery'

$(function() {
	$('.first select[name="category_id_first"]').change(function() {
    var categoryIdFirst = $('.first select[name="category_id_first"] option:selected').attr("value");
    var categoryDetails = gon.category_details.filter( cat => cat.category_id == categoryIdFirst );
    var count =  $('.first select[name="category_detail_id_first"]').children().length;
    for (var i=0; i<count; i++) {
      var categoryDetail = $('.first select[name="category_detail_id_first"] option:eq(' + i + ')');
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
  $('.first select[name="category_detail_id_first"]').change(function() {
    var categoryDetailId = $('.first select[name="category_detail_id_first"] option:selected').attr("value");
    var selectCategoryDetail = gon.category_details.filter( cat => cat.id == Number(categoryDetailId));
  })
})

$(function() {
	$('.second select[name="category_id_second"]').change(function() {
    var categoryIdSecond = $('.second select[name="category_id_second"] option:selected').attr("value");
    var categoryDetails = gon.category_details.filter( cat => cat.category_id == categoryIdSecond );
    var count =  $('.second select[name="category_detail_id_second"]').children().length;
    for (var i=0; i<count; i++) {
      var categoryDetail = $('.second select[name="category_detail_id_second"] option:eq(' + i + ')');
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
  $('.second select[name="category_detail_id_second"]').change(function() {
    var categoryDetailId = $('.second select[name="category_detail_id_second"] option:selected').attr("value");
    var selectCategoryDetail = gon.category_details.filter( cat => cat.id == Number(categoryDetailId));
  })
})


$(function() {
	$('.third select[name="category_id_third"]').change(function() {
    var categoryIdThird = $('.third select[name="category_id_third"] option:selected').attr("value");
    var categoryDetails = gon.category_details.filter( cat => cat.category_id == categoryIdThird );
    var count =  $('.third select[name="category_detail_id_third"]').children().length;
    for (var i=0; i<count; i++) {
      var categoryDetail = $('.third select[name="category_detail_id_third"] option:eq(' + i + ')');
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
  $('.third select[name="category_detail_id_third"]').change(function() {
    var categoryDetailId = $('.third select[name="category_detail_id_third"] option:selected').attr("value");
    var selectCategoryDetail = gon.category_details.filter( cat => cat.id == Number(categoryDetailId));
  })
})
