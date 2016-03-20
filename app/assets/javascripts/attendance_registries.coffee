@AttendantUtils =
  init: ->
    $('.attendant-item').click (ev)->
      ev.preventDefault()
      $(@).toggleClass('absent')
      false
  submit: ->
    absent_ids = []
    $.each($('.attendant-item.absent'), (index, ele) ->
      absent_ids.push(ele.dataset.studentId))
    console.log absent_ids
    $("#attendance_registry_absent_student_ids").val(absent_ids.join(','))
    $("#attendance_registry_form input.submit").click()

$ ->
  $('a#submit-attendance').click (ev) ->
    ev.preventDefault()
    AttendantUtils.submit()
    false
