$(document).ready(function() {
  $(".pray-link-write").on("click", function(e){
    $(".container-prayer").toggleClass("hidden");
  });
});

$(document).ready(function() {
  $(".pray-link-record").on("click", function(e){
    $(".record-prayer").toggleClass("hidden");
  });
});

$(document).ready(function() {
  $(".delete-link").on("click", function(e){
    $(".container-prayer").toggleClass("hidden");
  });
});
