$(document).ready(function () {
    $(window).scroll(function () {
        $(document).scrollTop(0);
    });
    $(".btn").click(function () {
        $(this).addClass("Active");
        $(this).removeClass("Disabled");
        $(this).siblings(".btn").addClass("Disabled");
        $(this).siblings(".btn").removeClass("Active");
        if ($("#Login").hasClass("Active")) {
            $("#label3").css("display", "none");
            $("#input3").css("display", "none");
            $("#label4").css("display", "block");
            $(".verification").css("display", "block");
            $("#loginbtn").css("display", "block");
            $("#signbtn").css("display", "none");
            $("#loginbtn").attr("name","true");
            $("#signbtn").attr("name","false");
        }else{
            $("#label3").css("display", "block");
            $("#input3").css("display", "block");
            $("#label4").css("display", "none");
            $(".verification").css("display", "none");
            $("#loginbtn").css("display", "none");
            $("#signbtn").css("display", "block");
            $("#signbtn").attr("name","true");
            $("#loginbtn").attr("name","false");
        }
    });
    $("input").focus(function () {
        $($(this).attr("data-place")).css({
            "bottom": "-10px",
            "font-size": "15px"
        });
    });
    $("input").blur(function () {
        $($(this).attr("data-place")).css({
            "bottom": "-20px",
            "font-size": "17px"
        });
    });
});