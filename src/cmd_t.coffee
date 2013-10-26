$ ->
  $.fn.cmd_t = (options) ->
    $search_field    = this
    $elements        = options.elements
    $filter_function = options.filter

    $search_field.on "keyup", ->
      query = $(this).val().toLowerCase()
      re    = new RegExp(query, "i")

      $elements.each (i, elem) ->
        name = $filter_function.call(elem)

        if name.match(re)?
          $(elem).show()
        else
          $(elem).hide()

    $(document).keyup (e) ->
      e = e || window.event
      keyCode = e.keyCode || e.which

      if keyCode == 84
        $search_field.focus()
        e.preventDefault()

      if keyCode == 27 && $(":focus").prop("id") == "project_filter"
        $search_field.val("")
        $search_field.trigger("keyup")
        $search_field.blur()
        e.preventDefault()

