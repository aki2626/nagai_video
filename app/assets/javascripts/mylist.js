$(function(){
  $('.left_box__icon').on("click", function(e){
    e.preventDefault();
    $('.relation_movies').addClass("display_none");
    $('.mylists_add').removeClass("display_none");
    $('.mylists_add').addClass("display_show");
  });
});