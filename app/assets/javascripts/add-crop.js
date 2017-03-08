$(document).on('turbolinks:load', function() {

  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 15
  });

  $('#autocomplete-crop-name').keyup(function() {
    $.ajax({
      type: 'POST',
      url: '/crops/search',
      dataType: 'json',
      data: {
        query: $('#autocomplete-crop-name').val()
      },
      success: function(data){
        var cropNames = {};
        for (crop in data) {
          cropNames[data[crop].name] = null
        }

        $('#autocomplete-crop-name').autocomplete({
          data: cropNames
        });
        $('.autocomplete-content li').on('click', function(e) {
          $.ajax({
            type: 'POST',
            url: '/crops/search_name',
            dataType: 'json',
            data: {
              query: e.target.innerText
            },
            success: function(selectedCrop) {
              $('#crop_default_image').val(selectedCrop.image_url);
              $('#default_crop_image').attr('src', selectedCrop.image_url).show();
            }
          });
        })
      }
    });

  });

});