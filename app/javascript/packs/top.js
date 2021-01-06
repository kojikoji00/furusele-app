// import $ from 'jquery'
// import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {
  $('.form-group').on('change',() => {
    $('.deduction').removeClass('hidden')
  })

  $('.category-select-first').on('change',() => {
    $('.result-first-category-title').append(
      `<div class='select_category_title_first'><p>${'.category-select-first'}</p></div>`
    )
  })

  $('.category-select-third').on('change',() => {
    $('.result-second-category-title').append(
      `<div class='select_category_title_second'><p>${'.category-select-second'}</p></div>`
    )
  })
  $('.result-third-category-title').on('change',() => {
    $('.result-third-category-title').append(
      `<div class='select_category_title_third'><p>${'.category-select-third'}</p></div>`
    )
  })
})