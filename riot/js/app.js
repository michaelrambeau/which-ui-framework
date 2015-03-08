(function() {
  var FilterListBase, app,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  FilterListBase = (function() {
    function FilterListBase(data, riotContext) {
      this.deleteButton = bind(this.deleteButton, this);
      this.saveButton = bind(this.saveButton, this);
      console.info('FilterListBase class');
      this.filters = data;
      if (typeof riotContext !== 'undefined') {
        riotContext.on('update', (function(_this) {
          return function() {
            var editMode, filter, i, j, len, ref;
            ref = _this.filters;
            for (i = j = 0, len = ref.length; j < len; i = ++j) {
              filter = ref[i];
              filter.number = i;
              editMode = filter.editMode;
              if (editMode == null) {
                filter.editMode = false;
              }
              console.log(filter);
            }
          };
        })(this));
      }
    }

    FilterListBase.prototype.editButton = function(e) {
      console.log('editButton', e.item);
      return e.item.editMode = true;
    };

    FilterListBase.prototype.saveButton = function(e) {
      this.readFormData(e);
      e.item.editMode = false;
    };

    FilterListBase.prototype.deleteButton = function(e) {
      return this.filters.splice(e.item.number, 1);
    };

    FilterListBase.prototype.cancelButton = function(e) {
      return e.item.editMode = false;
    };

    FilterListBase.prototype.getParentRow = function(e) {
      return $(e.currentTarget).closest('tr');
    };

    FilterListBase.prototype.readFormData = function(e) {
      var $row;
      $row = this.getParentRow(e);
      e.item.property = $row.find('[name=filterProperty]').val();
      e.item.keyword = $row.find('[name=filterKeyword]').val();
      return e.item.matching = $row.find('[name=filterMatching]').val();
    };

    return FilterListBase;

  })();

  app = {
    FilterList: FilterListBase
  };

  window.app = app;

}).call(this);
