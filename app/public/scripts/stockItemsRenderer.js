String.prototype.toPounds = function() {
  return '£' +
  this.slice(0, (this.length-2)) + 
  "." + 
  this.slice((this.length-2), this.length);
}

var thing = "2500";
console.log(thing.toPounds());

$(document).ready(function() {

  Handlebars.registerHelper('toPounds', function(price) {
    var price = price.toString();
    return price.toPounds();
  });

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

