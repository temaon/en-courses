$ ->
  new Swiper('.courses-section .swiper-container',
    pagination: '.swiper-pagination'
    paginationClickable: true)

  new Swiper('.faculties-section .swiper-container',
    effect: 'coverflow',
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: 3,
    initialSlide: 0,
    pagination: false,
    paginationClickable: false
    coverflow:
      rotate: 50,
      stretch: 0,
      depth: 100,
      modifier: 1,
      slideShadows : true)