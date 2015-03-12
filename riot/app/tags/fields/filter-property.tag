<filter-property>
  <div show="{ editMode }">
    <select name="filterProperty" class="form-control" onchange="{ change }">
      <option>From</option>
      <option>Subject</option>
      <option>To</option>
    </select>
  </div>

  <div show="{ !editMode }">
    { property }
  </div>

  <script type="text/coffeescript">
    console.log '<filter-property> item = ', this.opts.item
    @getValue = () =>
      $(@filterProperty).val()
    @change = (e) =>
      @parent.parent.trigger 'change-property',
        item: this.opts.item
  </script>

</filter-property>
