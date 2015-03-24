$(document).ready(function() {

  template.render('itemWidgetTemplate', function(itemWidgetTemplate) {
    Handlebars.registerPartial("itemWidgetTemplate", itemWidgetTemplate);
  });

  $.get('/api/stock_items', function(stockItemsData) {
    var stockItemsData = { stockItemsData: stockItemsData };

    template.render('stockItemsTemplate', function(stockItemsTemplate) {
      $('.stock-items-container').html( stockItemsTemplate(stockItemsData) );
    });
  });

});

