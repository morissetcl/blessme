$(window).scroll(function() {
    if($(this).scrollTop() > 150)  /*height in pixels when the navbar becomes non opaque*/
    {
        $('.opaque-navbar').addClass('opaque');
    } else {
        $('.opaque-navbar').removeClass('opaque');
    }
});

setTimeout(function() {
      $('.alert').fadeOut(300);
    }, 3000);

$(document).ready(function() {
  $('.notification').on('click', function(){
    $(this).addClass('hidden');
    $.ajax({
    type: 'GET',
    url: "/notifications/read_all_notification",
    });
  });
});

