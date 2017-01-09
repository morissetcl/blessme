// delete prayer

$(document).ready(function() {
  $(".fa-trash").on("click", function(e){
   var id = $(".fa-trash").data("id");
   var pain_id = $(".fa-trash").data("id-pain");
   swal ({
        title: 'Effacer',
        text: "Voulez-vous supprimer cette prière ?",
        type: 'question',
        showCancelButton: true,
        confirmButtonColor: '#B56969',
        cancelButtonColor: '#B4D8C0',
        confirmButtonText: 'Oui',
        cancelButtonText: 'Non'
      }).then(function() {
        $.ajax({
          type: 'DELETE',
          url: '/pains/' + pain_id + '/prayers/' + id,
          success: location.reload(),
        });
     });
  });
});

// delete prayer in user show

$(document).ready(function() {
  $(".user-show-delete").on("click", function(e){
   var id = $(this).data("id");
   var pain_id = $(this).data("id-pain");
   console.log(id)
   console.log(pain_id)
   swal ({
        title: 'Effacer',
        text: 'Voulez-vous supprimer cette prière ?',
        type: 'question',
        showCancelButton: true,
        confirmButtonColor: '#B56969',
        cancelButtonColor: '#B4D8C0',
        confirmButtonText: 'Oui',
        cancelButtonText: 'Non'
      }).then(function() {
        $.ajax({
          type: 'DELETE',
          url: '/pains/' + pain_id + '/prayers/' + id,
          success: location.reload(),
        });
     });
  });
});

