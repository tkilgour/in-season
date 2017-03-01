$(document).on('turbolinks:load', function() {
  $('#crop_harvest_date').datepicker({
    autoclose: true,
    format: 'dd/mm/yyyy'
    });

  $('#crop_name').bind('railsAutocomplete.select', (event, data) => {
    $('#crop_img').attr('src', data.item.image_url);
    $('#crop_default_image').attr('value', data.item.image_url);
  });
});