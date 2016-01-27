$("#tasks").html("<%= escape_javascript(render(partial: 'projects/tasks')).html_safe %>");

$ ->
  $('.js-delete-task').click((e) ->
    id = $(e.target).data('taskId')
    $.ajax({
      url: "/tasks/#{id}",
      type: 'DELETE'
    })
    .done((data, textStatus, jqXHR) ->
      $("\##{id}").remove()
    )
  )
