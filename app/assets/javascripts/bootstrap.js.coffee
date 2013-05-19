jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $('#modal').on('hidden', () ->
    $('.modal-body').html('');
    $('.modal-footer .mark_seen').remove();
  )