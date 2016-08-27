$(document).ready(function() {
  $('#sign-in-submit-btn').on('click', function() {
    var form = $('#sign-in-form');
    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize(),
      dataType: 'JSON',
      success: function(data) {
        window.location = data.after_sign_in_path
      },
      error: function(jqXHR) {
        toastr.error(jqXHR.responseJSON.error)
      }
    });
  });

  $('.registration-submit-btn').on('click', function() {
    var form = $(this).closest('.registration-form');
    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize(),
      dataType: 'JSON',
      success: function(data) {
        window.location = data.after_sign_in_path
      },
      error: function(jqXHR) {
        toastr.error(jqXHR.responseJSON.error)
      }
    });
  });
});
