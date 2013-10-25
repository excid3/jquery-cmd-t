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

