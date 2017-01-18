// Report pain

$(document).ready(function() {
  $(".signaler").on("click", function(e){
    var id = $(this).data("id");
    swal({
        title: "Signalement",
        text: "Voulez-vous signaler cette demande ?",
        type: "question",
        showCancelButton: true,
        confirmButtonColor: '#B56969',
        cancelButtonColor: '#B4D8C0',
        confirmButtonText: 'Oui',
        cancelButtonText: 'Non',
      }).then(function() {
        $.ajax({
          type: 'POST',
          url: '/pains/' + id + '/report',
        })
        .done(function() {
          swal("Signalé!", "Cette demande a été signalé", "success");
        })
        .error(function() {
          swal("Oops", "Une erreur s'est produite", "error");
        });
      });
  });
});

// Report prayer

$(document).ready(function() {
  $(".fa-exclamation-triangle").on("click", function(e){
    var id = $(this).data("id");
    console.log(id)
    swal({
        title: "Signalement",
        text: "Voulez-vous signaler cette demande ?",
        type: "question",
        showCancelButton: true,
        confirmButtonColor: '#B56969',
        cancelButtonColor: '#B4D8C0',
        confirmButtonText: 'Oui',
        cancelButtonText: 'Non',
      }).then(function() {
        $.ajax({
          type: 'POST',
          url: '/prayers/' + id + '/report_prayer',
        })
        .done(function() {
          swal("Signalé!", "Cette demande a été signalé", "success");
        })
        .error(function() {
          swal("Oops", "Une erreur s'est produite", "error");
        });
      });
  });
});

// Report prayer in user-show

$(document).ready(function() {
  $(".user-show-report").on("click", function(e){
    var id = $(this).data("id");
    console.log(id)
    swal({
        title: "Signalement",
        text: "Voulez-vous signaler cette demande ?",
        type: "question",
        showCancelButton: true,
        confirmButtonColor: '#B56969',
        cancelButtonColor: '#B4D8C0',
        confirmButtonText: 'Oui',
        cancelButtonText: 'Non',
      }).then(function() {
        $.ajax({
          type: 'POST',
          url: '/prayers/' + id + '/report_prayer',
        })
        .done(function() {
          swal("Signalé!", "Cette demande a été signalé", "success");
        })
        .error(function() {
          swal("Oops", "Une erreur s'est produite", "error");
        });
      });
  });
});
