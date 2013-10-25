# jquery-cmd-t

jquery-cmd-t is a super simple jQuery plugin for adding quick filtering elements on a page similar to Vim's Command-T and Ctrl-P plugins. Github also added the [File Finder](https://github.com/blog/793-introducing-the-file-finder) that this idea is mostly based on.

## Usage

jquery-cmd-t requires two things:

1. HTML elements you want to filter
2. An input field that is used to filter those elements

Here we're connecting the `#todo_filter` input to filter the todo line items. The `elements` option is a selector that grabs all the elements you want to hide/show. The `filter` option returns the text value that you want to match against. Your filters are executed in context of the element so you can dive deeper into any element to find which text you want to match against.

```html
<h1>Todo Items</h1>
<ul class="todos">
  <li>Get bread</li>
  <li>Get milk</li>
  <li>Get butter</li>
</ul>

<input type="text" id="todo_filter" placeholder="Filter...">

<script>
$(function() {
    $("#todo_filter").cmd_t({
        elements: $(".todos li"),
        filter: function() {
            return $(this).text();
        }
    });
});
</script>
```


## TODO
* Add hook to listen for when the letter "t" is pressed to automatically highlight input field automatically

## Author

Written by [Chris Oliver](excid3.com)

