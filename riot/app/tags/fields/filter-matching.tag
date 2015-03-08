<filter-matching>

  <div show="{ editMode }">
    <select name="filterMatching" class="form-control">
      <option>Contain</option>
      <option>Not contain</option>
      <option>Equal</option>
    </select>
  </div>

  <div show="{ !editMode }">
    { opts.data }
  </div>

  <script type="text/coffeescript">
    @getValue = () =>
      $(@filterMatching).val()
  </script>

</filter-matching>
