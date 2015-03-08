<filter-keyword>
  <div show={ editMode == true }>
    <input type="text" name="filterKeyword" class="form-control">
  </div>

  <div show="{ editMode == false }">
    { opts.data }
  </div>

  <script type="text/coffeescript">
    @on 'mount', () =>
      console.log 'mount', @opts
      @filterKeyword.value = @opts.data
      return
    @getValue = () =>
      console.log 'value', @filterKeyword
      $(@filterKeyword).val()
  </script>

</filter-keyword>
