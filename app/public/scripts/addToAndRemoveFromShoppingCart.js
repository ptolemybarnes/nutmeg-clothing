$(document).ready(function() {

  function addToShoppingCart(itemPid) {
    $.post('/api/shopping_carts/1/stock_items/'+ itemPid, function() {
      refreshShoppingCart();
    });
  } 

  function removeFromShoppingCart(itemPid) {
   $.ajax({
      url: "/api/shopping_carts/1/stock_items/" + itemPid,
      method: "DELETE",
      success: refreshShoppingCart()
    });
  } 

  function addToShoppingCartListener(callback) { 
    $('.stock-items-container').on('click', 'img.shopping-cart', function() {
      var itemPid = $(this).closest('.item-widget-contents').attr('id');
      callback(itemPid);
    });
  }
  
  function removeFromShoppingCartListener(callback) { 
    $(".shopping-cart-container").on("click", "img.remove-from-cart", function() {
      var itemPid = $(this).closest(".shopping-cart-item-contents").attr("id");
      callback(itemPid);
    });
  }

  removeFromShoppingCartListener( removeFromShoppingCart );
  addToShoppingCartListener( addToShoppingCart );
 
  template.render('shoppingCartPartial', function(shoppingCartPartial) {
    Handlebars.registerPartial("shoppingCartPartial", shoppingCartPartial);
  });

  var refreshShoppingCart = function() {
    $.get('/api/shopping_carts/1', function(shoppingCartData) {

      template.render('shoppingCartTemplate', function(shoppingCartTemplate) {
        $('.shopping-cart-container').html( shoppingCartTemplate( shoppingCartData) );
      });
    });
  }

  refreshShoppingCart();
});

