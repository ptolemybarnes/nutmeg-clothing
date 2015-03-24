$(document).ready(function() {
  $('.stock-items-container').on('click', 'img.shopping-cart', function() {
   var itemPid = $(this).closest('.item-widget-contents').attr('id');
   
   $.ajax({
     url: '/api/shopping_cart',
     method: 'PUT',
     data: { 'item_pid': itemPid }
   })
 });
});

