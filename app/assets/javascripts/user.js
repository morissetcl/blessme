$(document).ready(function(){
  $('#tab-pains').on('click', function(){
      $("#tab-notification").html(' ');
      $("#notification").html(' ');
  $.ajax({
    type: 'GET',
    url: "/notifications/read_all_notification",
    });
  });
});
