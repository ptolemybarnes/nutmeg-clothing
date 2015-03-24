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

 $('.stock-items-container').on('click', 'img.shopping-cart', function() {
   var itemPid = $(this).closest('.item-widget-contents').attr('id');
   
   $.ajax({
     url: '/api/shopping_cart',
     method: 'PUT',
     data: { 'item_pid': itemPid }
   })
 });
});

