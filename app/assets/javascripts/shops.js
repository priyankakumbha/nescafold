$(document).on("turbolinks:load", function (){
  var totalArr = [];
  var nameArr = [];
  var priceArr = [];
  var shopIdArr = [];
  var productIdArr = [];
  var quantityArr = [];

  var name = "";
  var productId = 0;
  var price = 0;
  var total = 0;
  var shopId = 0;
  var quantity = 0;

  var $total = $(".total");

  $("body").on("click",  ".checkItem" , function( e ){
    if ( this.parentElement.parentElement.getElementsByClassName("quantity")[0].value === ""){
      alert("Enter your quantity");
      // $(".checkItem").attr("checked", false);
      this.parentElement.parentElement.getElementsByClassName("checkItem")[0].checked = false;
      return;
    }else{
      // set check box
      if ( !this.parentElement.parentElement.getElementsByClassName("checkItem")[0].checked){
        var tempClassName = "."+this.parentElement.parentElement.getElementsByClassName("p_id")[0].innerHTML;
        //remove tag
        $(tempClassName).remove();

        // delete data from array
        var nameIdex = nameArr.indexOf(this.parentElement.parentElement.getElementsByClassName("p_name")[0].innerHTML);
        nameArr.splice( nameIdex , 1 );

        var productIdIndex = productIdArr.indexOf(this.parentElement.parentElement.getElementsByClassName("p_id")[0].innerHTML);
        productIdArr.splice( productIdIndex , 1 );

        var priceIndex = priceArr.indexOf(this.parentElement.parentElement.getElementsByClassName("p_price")[0].innerHTML);
        priceArr.splice( priceIndex , 1 );

        var quantityIndex = quantityArr.indexOf(this.parentElement.parentElement.getElementsByClassName("quantity")[0].value);
        quantityArr.splice( priceIndex , 1 );

        this.parentElement.parentElement.getElementsByClassName("quantity")[0].removeAttribute("disabled");

        total -= (parseInt(this.parentElement.parentElement.getElementsByClassName("p_price")[0].innerHTML) * parseInt(this.parentElement.parentElement.getElementsByClassName("quantity")[0].value));
        $total.html(total);

        this.parentElement.parentElement.getElementsByClassName("quantity")[0].value = "";

      }else{

        var $tr = $("<tr></tr>").attr("class" ,  this.parentElement.parentElement.getElementsByClassName("p_id")[0].innerHTML);

        shopId = this.parentElement.parentElement.getElementsByClassName("shop_id")[0].innerHTML;

        productId = this.parentElement.parentElement.getElementsByClassName("p_id")[0].innerHTML;
        productIdArr.push(productId);

        name = this.parentElement.parentElement.getElementsByClassName("p_name")[0].innerHTML;
        nameArr.push(name);

        price = this.parentElement.parentElement.getElementsByClassName("p_price")[0].innerHTML;
        priceArr.push(price);
        quantity = this.parentElement.parentElement.getElementsByClassName("quantity")[0].value;
        quantityArr.push(quantity);

        total += (parseInt(price) * parseInt(quantity) );
        this.parentElement.parentElement.getElementsByClassName("quantity")[0].disabled=true;


        $total.html(total);
        var nameTag = "<td>"+name+"</td>";
        var priceTag = "<td>"+price+"</td>";
        var quantityTag = "<td>"+quantity+"</td>";
        $tr.append(nameTag);
        $tr.append(priceTag);
        $tr.append(quantityTag);
        $(".order_list").append($tr);
      }
    }
        // .currentTarget.getElementsByClassName("p_name")[0].innerHTML;
  });
  $(".order_btn").on("click" , function(){
        $.ajax({
          url: "/orders",
          method: "POST",
          data: {
            name: nameArr,
            price: priceArr,
            shopId: shopId,
            productId: productIdArr,
            quantity: quantityArr ,
            total: total
          }
        }).done(function (data) {
          console.log( data );
        });
  });
});
