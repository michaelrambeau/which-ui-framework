    if true then @on 'update', () =>
      #initialize the editMode property if it does not exit
      for filter, i in @filters
        filter.number = i
        editMode = filter.editMode
        filter.editMode = false if not editMode?
      return

    @editButton = (e) =>
      console.log 'editButton', e.item
      e.item.editMode = true

    @saveButton = (e) =>
      @readFormData(e)
      e.item.editMode = false
      return

    @deleteButton = (e) =>
      @filters.splice(e.item.number, 1)

    @cancelButton = (e) =>
      e.item.editMode = false

    @getParentRow = (e) =>
      $(e.currentTarget).closest('tr')

    @readFormData = (e) =>
      $row = @getParentRow(e)
      e.item.property = $row.find('[name=filterProperty]').val()
      e.item.keyword = $row.find('[name=filterKeyword]').val()
      e.item.matching = $row.find('[name=filterMatching]').val()
