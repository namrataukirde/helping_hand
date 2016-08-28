$(document).ready(function() {
  $('#donation-search-form select').on('change', submitSearchForm);
  $('#donation-search-form input').on('keyup', submitSearchForm);
});

function submitSearchForm() {
  var searchForm = $('#donation-search-form');
  $.ajax({
    url: searchForm.attr('action'),
    data: searchForm.serialize(),
    dataType: 'script',
  })
}
