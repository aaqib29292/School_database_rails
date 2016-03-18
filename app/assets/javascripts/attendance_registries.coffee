@AttendantUtils =
  init: ->
    $('.attendant-item').click ->
      StudentDBUtils.toggle($(@).find('.fa'))
