$(function(){
  function buildcommentHTML(comment){
    if (comment.user_image) {
      var html =  `<div class="comment">
                      <div class="comment__user_icon">
                        ${comment.user_image}
                      </div>
                      <div class="comment_right">
                        <div class="comment_right__username">
                          ${comment.user_nickname}
                        </div>
                        <div class="comment_right__text">
                          ${comment.text}
                        </div>
                      </div>
                    </div>
      `
      return html;
    } else {
      var html =  `<div class="comment">
                      <div class="comment__user_icon">
                      </div>
                      <div class="comment_right">
                        <div class="comment_right__username">
                          ${comment.user_nickname}
                        </div>
                        <div class="comment_right__text">
                          ${comment.text}
                        </div>
                      </div>
                    </div>
      `
      return html;
    };
  }

  $('#new_comment').on("submit", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(comment){
      console.log(comment);
      var html = buildcommentHTML(comment);
      $(".comments_area").append(html);
      $("form")[0].reset();
    })
    .fail(function() {
      console.log("NG");
    })
  });
});