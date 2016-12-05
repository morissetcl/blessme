 $(function(){

  $(".tab").on("click", function(e){

    $(".tab").removeClass("active");
    $(this).addClass("active");

    $(".tab-content").addClass("hidden");

    var selection = $(this).data('target');
    $(selection).removeClass('hidden');
  });

});