$('#startRecordingButton').click(function() {
    //Now just reference this button and change CSS
    $(this).css('background-color','#B56969');
    $(this).css('color','white');
    $('#stopRecordingButton').css('background-color','white');
    $('#stopRecordingButton').css('color','black');
    $('#playButton').css('background-color','white');
    $('#playButton').css('color','black');
});

$('#stopRecordingButton').click(function() {
    //Now just reference this button and change CSS
    $(this).css('background-color','#B56969');
    $(this).css('color','white');
    $('#startRecordingButton').css('background-color','white');
    $('#startRecordingButton').css('color','black');
    $('#playButton').css('background-color','white');
    $('#playButton').css('color','black');
});

$('#playButton').click(function() {
    //Now just reference this button and change CSS
    $(this).css('background-color','#B56969');
    $(this).css('color','white');
    $('#stopRecordingButton').css('background-color','white');
    $('#stopRecordingButton').css('color','black');
    $('#startRecordingButton').css('background-color','white');
    $('#startRecordingButton').css('color','black');
});

$(document).ready(function() {
  $("#startRecordingButton").on("click", function(e){
    $(".recordingstart").toggleClass("hidden");
    $(".recordingplay").addClass("hidden");
    $(".recordingstop").addClass("hidden");
  });
});

$(document).ready(function() {
  $("#stopRecordingButton").on("click", function(e){
    $(".recordingstart").addClass("hidden");
    $(".recordingplay").addClass("hidden");
    $(".recordingstop").toggleClass("hidden");
  });
});

$(document).ready(function() {
  $("#playButton").on("click", function(e){
    $(".recordingstart").addClass("hidden");
    $(".recordingstop").addClass("hidden");
    $(".recordingplay").toggleClass("hidden");
  });
});

//loading page
