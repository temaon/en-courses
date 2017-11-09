$ ->
  console.log('tut')
  jQuery( ".selectpicker" ).select2(
    theme: "bootstrap"
  )

  new Swiper('.swiper-container',
    effect: 'coverflow',
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: 3,
    initialSlide: 1,
    coverflow:
      rotate: 50,
      stretch: 0,
      depth: 100,
      modifier: 1,
      slideShadows : true)
