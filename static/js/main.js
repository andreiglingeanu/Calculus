$(function () {
    $('.search').on('click', 'span.icon-gears', function () {
        $(this).closest('form').submit();
    });
});
