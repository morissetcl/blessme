$(document).ready(function(){

  $('.category-image').click(function(){
    $(this).toggleClass('.clicked');
  });

  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });


  $('.step-input').keyup(function(e){
    e.preventDefault();
    if(e.keyCode == 13)
    {
      var currentStep = $(this).parent().parent();
      currentStep.toggleClass("active");
      currentStep.next().addClass("active");
    }
  });


  $('.next-step').click(function(){
    var currentStep = $(this).parent();
    currentStep.toggleClass("active");
    currentStep.next().addClass("active");
  });

  // $('.step-input').click(function(e){
  //   e.preventDefault();
  //   $('.step-input'.removeClass("active");
  //   var clickedStep = $(this).parent().parent();
  //   clickedStep.toggleClass("active");
  // });


})
