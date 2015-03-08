<email-page>

  <h1>Riot - Email filters</h1>

  <email-filter-list data="{ data.emailFilters }"></email-filter-list>

  <forwarding-rules-list data="{ data.forwardingRules }"></forwarding-rules-list>

  <script type="text/coffeescript">
    console.log '<email-page> tag'
    @data =
      emailFilters: [
        property: 'From'
        keyword: 'larry.bird@celtics.com'
        matching: 'contain'
      ,
        property: 'From'
        keyword: 'scottie.pippen@bulls.com'
        matching: 'contain'
      ,
        property: 'Subject'
        keyword: 'Rakuten sale'
        matching: 'contain'
      ],
      forwardingRules: [
        property: 'From'
        keyword: 'chris.paul@clippers.com'
        email: 'tony.parker@spurs.com'
        matching: 'contain'
      ,
        property: 'Subject'
        keyword: 'Order confirmation'
        email: 'tim.duncan@spurs.com'
        matching: 'contain'
      ]
  </script>
</email-page>
