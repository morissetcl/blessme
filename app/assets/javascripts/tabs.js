 $(function(){

  $(".tab-title").on("click", function(e){

    $(".tab-title").removeClass("active");
    $(this).addClass("active");

    $(".tab-content").addClass("hidden");

    var selection = $(this).data('target');
    $(selection).removeClass('hidden');
  });

});