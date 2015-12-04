$(document).on('ready page:load', function () {
  $('[name="12"]').click(function() { // Plus d'un conducteur?
    if ($('#morethanadrivertrue').is(':checked')) {
      $('#otherdriverdetails').removeClass('hidden');
    } else {
      $('#otherdriverdetails').addClass('hidden');
    }
  })
});
