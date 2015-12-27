$(document).on('ready page:load', function () {
  if (data != null) {
    Object.keys(data).forEach(function(key) {
      var elem = $('#' + key);
      if (elem.is(':checkbox')) {
        if (elem.val() === data[key].value) {
          elem.prop("checked", true);
        }
      } else {
        elem.html(data[key].value);
      }
    });
  }
});
