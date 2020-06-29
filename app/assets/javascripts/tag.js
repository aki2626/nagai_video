$(function () {
  function indexTag(tag) {
    let html = `
    <div class="tags_lists__tag">
      ${tag.name}
    </div>
    `;
    $(".tags_js_index").append(html);

  }
  function addTag(tag) {
    let html = `
    <div class="tags_lists__tag">
      ${tag}
    </div>
    `;
    $(".tags_js_index").append(html);
  }

  $(".tags_area_regular__title").on("click", function(e) {
    e.preventDefault();
    let video_id = $(location).attr("pathname").replace(/[^0-9]/g, '');
    $.ajax({
      type: "GET",
      url: "/videos/tags",
      data: { id: video_id },
      dataType: "json"
    })
    .done(function(tags) {
      tags.forEach(function(tag) {
        indexTag(tag);
      })
    })
    .fail(function(tags) {
      console.log("失敗です。");
    });
  });
  $(".tags_add_form__submit").on("click", function(e){
    e.preventDefault();
    let input = $(".tags_add_form__text").val();
    console.log(input);
    addTag(input);
  });
})