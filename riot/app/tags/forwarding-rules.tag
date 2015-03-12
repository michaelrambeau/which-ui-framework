<forwarding-rules-list>
  <h2>Forwarding rules list ({ filterList.filters.length })</h2>

  <table class="table table-bordered table-striped" show="{ filterList.filters.length > 0 }">
    <thead>
      <tr>
        <td>#</td>
        <td>Property</td>
        <td>Keyword</td>
        <td>Matching</td>
        <td>Forwarding email address</td>
        <td>Actions</td>
      </tr>
    </thead>
    <tbody>
      <tr each="{ filterList.filters }">
        <td>{ number + 1 }</td>
        <td>
<!--          <my-tag></my-tag>-->
          <filter-property item="{ this }" change="{ parent.changeFilterProperty.bind(this) }" />
        </td>
        <td>
          <filter-keyword data="{ keyword }" />
        </td>
        <td>
          <filter-matching data="{ matching }" />
        </td>
        <td>
          <email-address />
        </td>
        <td>
          <div show="{ !editMode }">
            <button onclick={ parent.filterList.editButton } class="btn btn-primary">EDIT</button>
            <button onclick={ parent.filterList.deleteButton } class="btn btn-danger">DELETE</button>
          </div>
          <div show="{ editMode }">
            <button onclick="{ parent.filterList.saveButton }" class="btn btn-primary">SAVE</button>
            <button onclick="{ parent.filterList.cancelButton }" class="btn btn-default">CANCEL</button>
          </div>
        </td>
  </table>

  <div show="{ filterList.filters.length == 0 }" class="alert alert-warning">No filter.</div>

  <script type="text/coffeescript">
    @filterList = new app.FilterList @opts.data, this

    @changeFilterProperty = (e) =>
      console.log 'changeFilterProperty', this, $(e.currentTarget)
    riot.observable(this)
    @on 'change-property', (data) =>
      console.info 'Event!!!!!', data
  </script>
</forwarding-rules-list>
