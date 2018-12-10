$(function () {
    $(".problem-title").click(function () {
        $(".problem-list .problem-content").hide();
        $(this).siblings().fadeIn();
    })
})