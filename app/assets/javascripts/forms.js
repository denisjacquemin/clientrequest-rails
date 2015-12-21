// save forms data into firebase


var firebaseRef = new Firebase("https://clientrequest.firebaseio.com/");

$(document).on('ready page:load', function () {

  var form_uid = $('#form_uid').val();
  if (form_uid != undefined) {
    firebaseRef.child('forms').child(form_uid).on('value', function(snap) {
      snap.forEach(function(childSnapshot) {
        var selector = '#' + childSnapshot.key();
        var elem = $(selector)

        if (elem.is( "[type=text]" )) {
          elem.val(childSnapshot.val().value);
        } else if (elem.is(':checkbox')) {
            elem.prop("checked", true);
        } else if ($('input[name="' + childSnapshot.key() + '"]').is(':radio')) {
          $('input[name="' + childSnapshot.key() + '"]').each(function(i, r) {
            if (r.value === childSnapshot.val().value) {
              $(r).prop("checked", true);
            } else {
              $(r).prop("checked", false);
            }
          });
        }
      });
    })
  }


  // observe changes and save them to Firebase
  $('.fb input[type="text"], .fb textarea').keyup(function(event) {
    firebaseRef.child('forms').child(form_uid).child(event.target.id).update({"value": event.target.value});
  });

  $('.fb input:radio').change(function(event) {
    firebaseRef.child('forms').child(form_uid).child(event.target.name).update({"value": event.target.value});
  });

  $('.fb input:checkbox').change(function(event) {
    if (event.target.checked) {
      firebaseRef.child('forms').child(form_uid).child(event.target.id).update({"value": event.target.value});
    } else {
      firebaseRef.child('forms').child(form_uid).child(event.target.id).remove();
    }
  });
});
