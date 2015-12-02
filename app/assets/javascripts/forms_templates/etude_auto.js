
$('[name="morethanadriver"]').click(function() {
  console.log('morethanadrivertrue changed');
  if ($('#morethanadrivertrue').is(':checked')) {
    $('#otherdriverdetails').removeClass('hidden');
  } else {
    $('#otherdriverdetails').addClass('hidden');
  }
})
