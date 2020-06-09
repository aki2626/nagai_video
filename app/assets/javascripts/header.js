$(function(){
  $('#hover_menu').hover(
    function(e){
      $('.menu').removeClass("display_none");
      $('.menu').addClass("display_show");
    },
    function(e) {
      $('.menu').removeClass("display_show");
      $('.menu').addClass("display_none");
    }
  );
});