$(function() {
  $(".search").on("click", "span.icon-gears", function() {
    $(this)
      .closest("form")
      .submit();
  });

  $(".panel li").each(function() {
    var query = $.trim($(this).html()),
      encoded = encodeURIComponent(query);

    $(this).html("");
    $(this).append('<a href="/query?q=' + encoded + '">' + query + "</a>");
    $(this).append('<i class="icon-arrow-right">');
    $(this).attr("data-query", query);
  });

  $(document).on("click", ".panel li", function(e) {
    var url = "/query?q=" + encodeURIComponent($(this).data("query"));

    if (e.ctrlKey) {
      var win = window.open(url, "_blank");
      win.focus();
    } else {
      location = url;
    }

    return false;
  });
  $(document).on("contextmenu", ".panel li", function(e) {
    var $inp = $(".search input"),
      val = $inp.val();

    $inp.val(val + $(this).data("query"));

    $("html, body").animate(
      {
        scrollTop: $inp.offset().top - 10
      },
      300
    );
    return false;
  });
});

$(".toggle .open").on("click", function() {
  var $content = $(this)
      .closest(".panel")
      .find(".content"),
    $icon = $(this).find("i");

  $content.slideToggle("fast");
  $icon.toggleClass("icon-plus icon-minus");

  return false;
});
