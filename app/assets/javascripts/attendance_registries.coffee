@AttendantUtils =
  init: ->
    $('.attendant-item').click (ev)->
      ev.preventDefault()
      StudentDBUtils.toggle($(@).find('.fa'))
      $(@).toggleClass('absent')
      false
  submit: ->
    absentees_ids = []
    $.each($('.attendant-item.absent'), (index, ele) ->
      absentees_ids.push(ele.dataset.studentId))
    console.log absentees_ids
    $("#attendance_registry_absentee_ids").val(absentees_ids.join(','))
    $("#attendance_registry_form")[0].submit()

$ ->
  $('a#submit-attendance').click (ev) ->
    ev.preventDefault()
    AttendantUtils.submit()
    false
