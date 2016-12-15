$(document).ready(function(){

  $('#second-area :input').prop('disabled', true);
  $('#third-area :input').prop('disabled', true );

  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });

  //Premier vers deuxième champ

  $('.step-input').keyup(function(e){
    e.preventDefault();
    if(e.keyCode == 13)
    {
      var currentStep = $(this).parent().parent();
      currentStep.toggleClass("active");
      currentStep.next().addClass("active");
      $('html, body').animate({ scrollTop: 200 }, 'slow');
      $('#arrow').removeClass("hidden");
      $('#first-area :input').prop("disabled", true);
      $('#second-area :input').prop("disabled", false);
      $('#down-step').prop('disabled', true);
    }
  });

  // Compteur de mots

  $('.step-input').keyup(function () {
    var max = 30;
    var len = $(this).val().length;
    var char = max - len;
    $('#title_counter').text(char);
  });

  //remontée

  $('#arrow').click(function(){
    $('#second-area').toggleClass("active");
    $('#first-area').addClass("active");
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    $('#first-area :input').prop( "disabled", false );
    $('#second-area :input').prop( "disabled", true );
    $('#arrow').addClass("hidden");
  });

  //Deuxième champ

  $('.category-image').click(function(){
    $(this).toggleClass('.clicked');
    $('#down-step').removeClass('hidden')
  });

  //Deuxième vers troisième champ

  $('.next-step').click(function(){
    var currentStep = $(this).parent();
    currentStep.toggleClass("active");
    currentStep.next().addClass("active");
    $('#arrow').addClass("hidden");
    $('#description-arrow').toggleClass("hidden");
    $('#second-area :input').prop( "disabled", true );
    $('#third-area :input').prop( "disabled", false );
  });

  var n = $(document).height();
  $('#down-step').on("click", function(){
    $('html, body').animate({ scrollTop: n }, 'slow');
  });

  // Deuxième remontée

  $('#description-arrow').click(function(){
    $('#third-area').toggleClass("active");
    $('#second-area').addClass("active");
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    $('#arrow').toggleClass("hidden");
    $('#description-arrow').addClass("hidden");
    $('#second-area :input').prop( "disabled", false );
    $('#third-area :input').prop( "disabled", true );
  });


  // $('.step-input').click(function(e){
  //   e.preventDefault();
  //   $('.step-input'.removeClass("active");
  //   var clickedStep = $(this).parent().parent();
  //   clickedStep.toggleClass("active");
  // });
})
