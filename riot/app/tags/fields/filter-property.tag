<filter-property>
  <div show="{ editMode }">
    <select name="filterProperty" class="form-control">
      <option>From</option>
      <option>Subject</option>
      <option>To</option>
    </select>
  </div>

  <div show="{ !editMode }">
    { property }
  </div>

  <script type="text/coffeescript">
    console.log '<filter-property>', this
    @getValue = () =>
      $(@filterProperty).val()
  </script>

</filter-property>
