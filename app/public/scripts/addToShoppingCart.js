$(document).ready(function() {
  $('.stock-items-container').on('click', 'img.shopping-cart', function() {
   var itemPid = $(this).closest('.item-widget-contents').attr('id');
   
   $.ajax({
     url: '/api/shopping_cart',
     method: 'PUT',
     data: { 'item_pid': itemPid }
   })
 });
  
  template.render('shoppingCartPartial', function(shoppingCartPartial) {
    Handlebars.registerPartial("shoppingCartPartial", shoppingCartPartial);
  });

  $.get('/api/shopping_cart', function(shoppingCartData) {
    var shoppingCartData = { shoppingCartData: shoppingCartData };

    template.render('shoppingCartTemplate', function(shoppingCartTemplate) {
      $('.shopping-cart-container').html( shoppingCartTemplate( shoppingCartData) );
    });
  });



});

