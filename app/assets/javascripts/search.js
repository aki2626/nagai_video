$(function() {
  $('#tag_js').on("click", function(e) {
    e.preventDefault();
    $(".keyword_search").removeClass("display_show");
    $(".keyword_search").addClass("display_none");
    $(".tag_search").removeClass("display_none");
    $('.tag_search').addClass("display_show");
  });
  $('#keyword_js').on("click", function(e) {
    e.preventDefault();
    $(".tag_search").removeClass("display_show");
    $(".tag_search").addClass("display_none");
    $(".keyword_search").removeClass("display_none");
    $('.keyword_search').addClass("display_show");
  });
});