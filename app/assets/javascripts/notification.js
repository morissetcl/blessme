var update = function () {

  $.ajax({
  type: 'GET',
  url: "/get-notif"
  });
};

setInterval(update, 60000);

$(document).ready(function() {

  $('#notification-dropdown').on('click', function(){
    $("#notification").html(' ');
    $("#notification").css('color', 'black');
    $.ajax({
    type: 'GET',
    url: "/notifications/read_all_notification",
    });
  });
});
