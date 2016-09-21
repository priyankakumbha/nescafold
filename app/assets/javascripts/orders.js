$(document).on("turbolinks:load", function (){
  $(".order_name").on("click" , function(e){
    //prevent submit event
    getListItem(e.currentTarget.innerHTML);
  });
});


var getListItem = function( name ){

  $.ajax({
    // url: "/line
    url: "/lineItemList" ,
    type: "GET",
    data: {
      name: name
    },
    dataType: "JSON"
  }).done( showLineItems );
};

var showLineItems = function ( data ){
  $(".orderItem").html("");
  var $body = $(".orderItem");
  var $total = $(".total");
  var totalValue = 0;
  $total.text("0");
  for (var i = 0; i < data.lineItems.length; i++) {
    var $tr = $("<tr></tr>");
    var $nameTag = $("<td></td>");
    $nameTag.text(data.lineItems[i].product.name);
    var $priceTag = $("<td></td>");
    $priceTag.text(data.lineItems[i].product.price);
    var $QuantityTag = $("<td></td>");
    $QuantityTag.text(data.lineItems[i].quantity);
    var $status = $("<td></td>");
    $status.text(data.order.status);
    $tr.append($nameTag);
    $tr.append($priceTag);
    $tr.append($QuantityTag);
    $tr.append($status);
    $body.append($tr);
    totalValue +=  ( parseInt(data.lineItems[i].product.price) * parseInt(data.lineItems[i].quantity)  );
  }
  $total.text(totalValue);
  // Create a tr for every order`
    // Add a td for the name, status, quantity and price
};
