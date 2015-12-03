// save forms data into firebase


var firebaseRef = new Firebase("https://clientrequest.firebaseio.com/");

firebaseRef.child('test').on('value', function(snap) {
  console.log('Test: ' + snap.val());
});

$(document).on('ready page:load', function () {
  var form_uid = $('#form_uid').val();
  firebaseRef.child('forms').child(form_uid).once('value', function(snap) {
    snap.forEach(function(childSnapshot) {
      var selector = '#' + childSnapshot.key();
      var elem = $(selector)

      if (elem.is( "[type=text]" )) {
        elem.val(childSnapshot.val().value);
      } else if (elem.is(':radio')) {
        $('input[name="' + childSnapshot.key() + '"]').each(function(r) {
          if (r.value === childSnapshot.val().value) {
            r.prop("checked", true);
          } else {
            r.prop("checked", false);
          }
        });
      }  // end else if
    });
  })


  // observe changes and save them to Firebase
  $('input[type="text"]').keyup(function(event) {
    firebaseRef.child('forms').child(form_uid).child(event.target.id).update({"value": event.target.value});
  });

  $('input:radio').change(function(event) {
    console.log('saving ' + event.target.value + ' to forms/' + form_uid + '/' + event.target.name);
    firebaseRef.child('forms').child(form_uid).child(event.target.name).update({"value": event.target.value});
  });
});
