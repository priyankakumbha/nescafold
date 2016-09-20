$(document).on("turbolinks:load", function (){
  var totalArr = [];
  var nameArr = [];
  var priceArr = [];
  var shopIdArr = [];
  var productIdArr = [];

  var name = "";
  var productId = 0;
  var price = 0;
  var total = 0;
  var shopId = 0;

  $("body").on("click",  ".data", function( e ){
    var $total = $(".total");
    var $tr = $("<tr></tr>");
    shopId = e.currentTarget.getElementsByClassName("shop_id")[0].innerHTML;
    shopIdArr.push(shopId);
    productId = e.currentTarget.getElementsByClassName("p_id")[0].innerHTML;
    productIdArr.push(productId);
    name = e.currentTarget.getElementsByClassName("p_name")[0].innerHTML;
    nameArr.push(name);

    price = e.currentTarget.getElementsByClassName("p_price")[0].innerHTML;
    priceArr.push(price);
    totalArr.push(price);
    for ( var i = 0 ; i < totalArr.length; i++){
      total += parseInt(totalArr[i]);
    }
    $total.html(total);
    var nameTag = "<td>"+name+"</td>";
    var priceTag = "<td>"+price+"</td>";
    $tr.append(nameTag);
    $tr.append(priceTag);
    $(".order_list").append($tr);
    // .currentTarget.getElementsByClassName("p_name")[0].innerHTML;
  });
  $(".order_btn").on("click" , function(){
        $.ajax({
          url: "/orders",
          method: "POST",
          data: {
            name: nameArr,
            price: priceArr,
            shopId: shopIdArr,
            productId: productIdArr,
            total: total
          }
        }).done(function (data) {
          console.log( data );
        });
  });
});
