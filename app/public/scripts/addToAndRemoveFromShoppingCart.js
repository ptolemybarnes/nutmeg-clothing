$(document).ready(function() {
  $('.stock-items-container').on('click', 'img.shopping-cart', function() {
   var itemPid = $(this).closest('.item-widget-contents').attr('id');
   
   $.ajax({
     url: '/api/shopping_cart',
     method: 'PUT',
     data: { 'item_pid': itemPid },
     success: refreshShoppingCart()
   })
 });

  $(".shopping-cart-container").on("click", "img.remove-from-cart", function() {
    var itemPid = $(this).closest(".shopping-cart-item-contents").attr("id");

    $.ajax({
      url: "/api/shopping_cart/" + itemPid,
      method: "DELETE",
      success: refreshShoppingCart()
    });
  });
  
  template.render('shoppingCartPartial', function(shoppingCartPartial) {
    Handlebars.registerPartial("shoppingCartPartial", shoppingCartPartial);
  });

  var refreshShoppingCart = function() {
    $.get('/api/shopping_cart', function(shoppingCartData) {

      template.render('shoppingCartTemplate', function(shoppingCartTemplate) {
        $('.shopping-cart-container').html( shoppingCartTemplate( shoppingCartData) );
      });
    });
  }
  
  refreshShoppingCart();
});

