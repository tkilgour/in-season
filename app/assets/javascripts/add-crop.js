$(() => {
  $('#crop_harvest_date').datepicker({
    autoclose: true
  });

  $('#crop_name').bind('railsAutocomplete.select', (event, data) => {
    $('#crop_img').attr('src', data.item.image_url);
  });
});