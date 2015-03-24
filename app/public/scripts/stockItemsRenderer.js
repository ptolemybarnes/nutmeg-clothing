$(document).ready(function() {

  template.render('stockItemsPartial', function(stockItemsPartial) {
    Handlebars.registerPartial("stockItemsPartial", stockItemsPartial);
  });

  $.get('/api/stock_items', function(stockItemsData) {
    var stockItemsData = { stockItemsData: stockItemsData };

    template.render('stockItemsTemplate', function(stockItemsTemplate) {
      $('.stock-items-container').html( stockItemsTemplate(stockItemsData) );
    });
  });
});

