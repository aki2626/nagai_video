$(function(){
  function buildHTML(mylist){
    var html =
    `<li class="user_mylists__mylist">
      <a rel="nofollow" data-method="post" href="/videos/${video_id}/mylists/${mylist_id}/add">${title}
      </a>
    </li>`
    return html;
  }
  $('.left_box__icon').on("click", function(e){
    e.preventDefault();
    $('.relation_movies').removeClass("display_show");
    $('.relation_movies').addClass("display_none");
    $('.mylists_add').removeClass("display_none");
    $('.mylists_add').addClass("display_show");
  });
  $('.mylists_add__header--cancel').on("click", function(e){
    e.preventDefault();
    $('.mylists_add').removeClass("display_show");
    $('.mylists_add').addClass("display_none");
    $('.relation_movies').removeClass("display_none");
    $('.relation_movies').addClass("display_show");
  });
  $('.user_mylists__mylist--new_mylist').on("click", function(e){
    e.preventDefault();
    $('.user_mylists').addClass("display_none");
    $('.create_mylist').removeClass("display_none");
    $('.create_mylist').addClass("display_show");
  });
  $('.mylist_btn__cancel').on("click", function(e){
    e.preventDefault();
    $('.create_mylist').removeClass("display_show");
    $('.create_mylist').addClass("display_none");
    $('.user_mylists').removeClass("display_none");
    $('.user_mylists').addClass("display_show");
  });

  $('#new_mylist').on("submit", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $(".user_mylists").append(html);
      $("form")[0].reset();
    })
  })
});