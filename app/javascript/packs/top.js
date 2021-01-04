// import $ from 'jquery'
// import axios from 'modules/axios'

document.addEventListener('DOMContentLoaded', () => {
  $('.form-group').on('change',() => {
    $('.deduction').removeClass('hidden')
  })

  $('.category_first').on('change',() => {
    $('.select_category_title.first').append(
      `<div class='select_category_title_first'><p>${'.category_first'}</p></div>`
    )
  })

  $('.category_second').on('change',() => {
    $('.select_category_title.second').append(
      `<div class='select_category_title_second'><p>${'.category_second'}</p></div>`
    )
  })
  $('.category_third').on('change',() => {
    $('.select_category_title.third').append(
      `<div class='select_category_title_third'><p>${'.category_third'}</p></div>`
    )
  })
})