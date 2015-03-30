$(document).ready(function() {

  function addToShoppingCart(itemPid) {
    $.post('/api/shopping_carts/1/stock_items/'+ itemPid, function(message) {
      if (message.error) {
        $('body').append("The requested item is out of stock") }
      else {
      refreshShoppingCart() }
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
    $('.stock-items-container').on('click', 'img.add-to-shopping-cart', function() {
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


  template.render('shoppingCartPartial', function(shoppingCartPartial) {
    Handlebars.registerPartial("shoppingCartPartial", shoppingCartPartial);
  });

  template.render('vouchersPartial', function(vouchersPartial) {
    Handlebars.registerPartial('vouchersPartial', vouchersPartial);
  });

  var refreshShoppingCart = function() {
    $.get('/api/shopping_carts/1', function( shoppingCartData ) {
      $.get('/api/vouchers',function( vouchersData ) {
        shoppingCartData['vouchersData'] = vouchersData;

        template.render('shoppingCartTemplate', function( shoppingCartTemplate ) {
          $('.shopping-cart-container').html( shoppingCartTemplate( shoppingCartData ) );
        });
      });
    });
  }
  function addVoucherToShoppingCartListener(callback) {
    $('.shopping-cart-container').on('click', 'button.add-voucher', function() {
      var voucherID = $(this).attr('value');
      
      callback(voucherID); 
    });
  }

  function addVoucherToShoppingCart(voucherID) {
    $.ajax({
        url: '/api/shopping_carts/1/vouchers/' + voucherID,
     method: 'POST',
    success: refreshShoppingCart,
 statusCode: {
   412: invalidVoucherNotice
 }
    });
  }

  function invalidVoucherNotice() {
    $('section.vouchers').append('<p>Invalid Voucher</p>');
  }
  
  refreshShoppingCart();

  // Listeners
  removeFromShoppingCartListener( removeFromShoppingCart );
  addToShoppingCartListener( addToShoppingCart );
  addVoucherToShoppingCartListener( addVoucherToShoppingCart );
});

