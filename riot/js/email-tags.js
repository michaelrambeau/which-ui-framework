riot.tag('email-filter-list', '<h2>Email filter list ({ filterList.filters.length })</h2> <table class="table table-bordered table-striped" show="{ filterList.filters.length > 0 }"> <thead> <tr> <td>#</td> <td>Property</td> <td>Keyword</td> <td>Matching</td> <td>Actions</td> </tr> </thead> <tbody> <tr each="{ filterList.filters }"> <td>{ number + 1 }</td> <td>  <filter-property></filter-property> </td> <td> <filter-keyword data="{ keyword }"></filter-keyword> </td> <td> <filter-matching data="{ matching }"></filter-matching> </td> <td> <div show="{ !editMode }"> <button onclick="{ parent.filterList.editButton }" class="btn btn-primary">EDIT</button> <button onclick="{ parent.filterList.deleteButton }" class="btn btn-danger">DELETE</button> </div> <div show="{ editMode }"> <button onclick="{ parent.filterList.saveButton }" class="btn btn-primary">SAVE</button> <button onclick="{ parent.filterList.cancelButton }" class="btn btn-default">CANCEL</button> </div> </td> </table> <div show="{ filterList.filters.length == 0 }" class="alert alert-warning">No filter.</div>', function(opts) {this.filterList = new app.FilterList(this.opts.data, this);

});

riot.tag('email-page', '<h1>Riot - Email filters</h1> <email-filter-list data="{ data.emailFilters }"></email-filter-list> <forwarding-rules-list data="{ data.forwardingRules }"></forwarding-rules-list>', function(opts) {console.log('<email-page> tag');

this.data = {
  emailFilters: [
    {
      property: 'From',
      keyword: 'larry.bird@celtics.com',
      matching: 'contain'
    }, {
      property: 'From',
      keyword: 'scottie.pippen@bulls.com',
      matching: 'contain'
    }, {
      property: 'Subject',
      keyword: 'Rakuten sale',
      matching: 'contain'
    }
  ],
  forwardingRules: [
    {
      property: 'From',
      keyword: 'chris.paul@clippers.com',
      email: 'tony.parker@spurs.com',
      matching: 'contain'
    }, {
      property: 'Subject',
      keyword: 'Order confirmation',
      email: 'tim.duncan@spurs.com',
      matching: 'contain'
    }
  ]
};

});

riot.tag('forwarding-rules-list', '<h2>Forwarding rules list ({ filterList.filters.length })</h2> <table class="table table-bordered table-striped" show="{ filterList.filters.length > 0 }"> <thead> <tr> <td>#</td> <td>Property</td> <td>Keyword</td> <td>Matching</td> <td>Forwarding email address</td> <td>Actions</td> </tr> </thead> <tbody> <tr each="{ filterList.filters }"> <td>{ number + 1 }</td> <td>  <filter-property ></filter-property> </td> <td> <filter-keyword data="{ keyword }"></filter-keyword> </td> <td> <filter-matching data="{ matching }"></filter-matching> </td> <td> <email-address ></email-address> </td> <td> <div show="{ !editMode }"> <button onclick="{ parent.filterList.editButton }" class="btn btn-primary">EDIT</button> <button onclick="{ parent.filterList.deleteButton }" class="btn btn-danger">DELETE</button> </div> <div show="{ editMode }"> <button onclick="{ parent.filterList.saveButton }" class="btn btn-primary">SAVE</button> <button onclick="{ parent.filterList.cancelButton }" class="btn btn-default">CANCEL</button> </div> </td> </table> <div show="{ filterList.filters.length == 0 }" class="alert alert-warning">No filter.</div>', function(opts) {this.filterList = new app.FilterList(this.opts.data, this);

});

riot.tag('email-address', '<div show="{ editMode == true }"> <input type="text" name="email" class="form-control" value="{ email }"> </div> <div show="{ editMode == false }"> { email} </div>', function(opts) {

});

riot.tag('filter-keyword', '<div show="{ editMode == true }"> <input type="text" name="filterKeyword" class="form-control"> </div> <div show="{ editMode == false }"> { opts.data } </div>', function(opts) {this.on('mount', (function(_this) {
  return function() {
    console.log('mount', _this.opts);
    _this.filterKeyword.value = _this.opts.data;
  };
})(this));

this.getValue = (function(_this) {
  return function() {
    console.log('value', _this.filterKeyword);
    return $(_this.filterKeyword).val();
  };
})(this);

});

riot.tag('filter-matching', '<div show="{ editMode }"> <select name="filterMatching" class="form-control"> <option>Contain</option> <option>Not contain</option> <option>Equal</option> </select> </div> <div show="{ !editMode }"> { opts.data } </div>', function(opts) {this.getValue = (function(_this) {
  return function() {
    return $(_this.filterMatching).val();
  };
})(this);

});

riot.tag('filter-property', '<div show="{ editMode }"> <select name="filterProperty" class="form-control"> <option>From</option> <option>Subject</option> <option>To</option> </select> </div> <div show="{ !editMode }"> { property } </div>', function(opts) {console.log('<filter-property>', this);

this.getValue = (function(_this) {
  return function() {
    return $(_this.filterProperty).val();
  };
})(this);

});

riot.tag('my-tag', 'My tag!{ keyword }', function(opts) {
});
