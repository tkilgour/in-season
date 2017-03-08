

$(document).on('turbolinks:load', function() {

  $('input.autocomplete').autocomplete({
    data: {
      "Apple": null,
      "Microsoft": null,
      "Google": 'http://placehold.it/250x250'
    },
    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
  });

    $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15
  });
});