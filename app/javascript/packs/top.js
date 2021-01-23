// import $ from 'jquery'
// import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {
  $('.personal-form-group-family').on('change',() => {
    $('.personal-form-group-action').trigger('click')
  })

  $('.personal-form-group-action').on('click',() => {
    $('.deduction').removeClass('hidden')
  })

  $('.category-select-first').on('change',() => {
    $('.result-category-title-first').append(
      `<div class='select_category_title_first'><h3>カテゴリー１：${'.category-select-first'}</h3></div>`
    )
  })

  $('.category-select-second').on('change',() => {
    $('.result-category-title-second').append(
      `<div class='select_category_title_second'><h3>カテゴリー２：${'.category-select-second'}</h3></div>`
    )
  })
  $('.category-select-third').on('change',() => {
    $('.result-category-title-third').append(
      `<div class='select_category_title_third'><h3>カテゴリー３：${'.category-select-third'}</h3></div>`
    )
  })
})

// $('.slider').slick();
$('.slider').slick({
  slidesToShow: 2,
  slidesToScroll: 1,
  autoplay: true,
  autoplaySpeed: 4200,
});