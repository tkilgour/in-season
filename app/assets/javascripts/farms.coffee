# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.best_in_place').best_in_place()

  $("#csa_availability_checkbox").change ->
      $("#csa_availability_checked_true").toggleClass('hidden') # toggleClass and not just toggle
