import $ from 'jquery'
// import slick from 'slick-carousel'
import 'slick-carousel'

document.addEventListener('DOMContentLoaded', function(){
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 4200,
    dots: true,
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    adaptiveHeight: true
  })
  // $('.slider').slick({
  //   slidesToShow: 1,
  //   slidesToScroll: 1,
  //   autoplay: true,
  //   autoplaySpeed: 4200,
  // })
});

