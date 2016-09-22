$(document).on("turbolinks:load", function() {
  console.log("start");
  var itemArr = [];
  // single item list
  var shop_id = 0;
  var product_id = 0;
  var product_name = "";
  var product_price = 0;
  var product_quantity = 0;

  var totalValue = 0;

  var $total = $(".total");

  // Add sopping cart
  $("body").on("click", "#add_button", function(e) {

    // save clicked item
    shop_id = parseInt($(this).parent().find(".shop_id")[0].value);
    product_id = parseInt($(this).parent().find(".product_id")[0].value);
    product_name = $(this).parent().find("h3").text();
    product_price = parseInt($(this).parent().find(".product_price")[0].value);   product_quantity = parseInt($(this).parent().find("select")[0].value);

    if ( itemArr.length > 0){
      for ( var i = 0; i < itemArr.length; i ++ ){
        // has same product
      
        if(itemArr[i].product_name === product_name){
          itemArr[i].product_quantity += product_quantity;
          totalValue += (product_price * product_quantity);
          var $targetTag = $("."+product_name.split(' ').join(''));
          $targetTag.text(itemArr[i].product_quantity);
          $total.text("Price: $"+totalValue);

          return ;
        }
        console.log("end if ");
      }
      console.log("end for");
      itemArr.push({
        shop_id: shop_id ,
        product_id: product_id,
        product_name: product_name,
        product_price: product_price,
        product_quantity: product_quantity
      });
      createTag(product_name , product_quantity);
      totalValue += (product_price * product_quantity);
      $total.text("Price: $"+totalValue);
      console.log("end if ");
    }else{
      itemArr.push({
        shop_id: shop_id ,
        product_id: product_id,
        product_name: product_name,
        product_price: product_price,
        product_quantity: product_quantity
      });
      createTag(product_name , product_quantity);
      totalValue += (product_price * product_quantity);
      $total.text("Price: $"+totalValue);
    }
  });
  // cancel shopping item
  $("body").on("click", ".badge", function(e) {

    var targetName = $(this).parent().find("p").text();
    for ( var i = 0 ; i < itemArr.length; i++){
      if (itemArr[i].product_name === targetName ){
        var minusValue =( itemArr[i].product_price * itemArr[i].product_quantity);
        totalValue -= minusValue;
        itemArr.splice( i , 1);
        this.parentElement.remove();
        $total.text("Price: $"+totalValue);

        return ;
      }
    }

  });

  // order shopping list
  $("#order_btn").on("click" , function(){
        $.ajax({
          url: "/orders",
          method: "POST",
          data: {
            orderList: itemArr
          }
        }).done(function (data) {
          console.log( data );
        });
  });
});

var createTag = function ( name , quantity ){
  $container = $(".order_div");

  $newli = $("<li></li>").addClass("list-group-item");
  $badgeSpanTag = $("<span></span>").addClass("badge");
  $quantitySpan = $("<span></span>").attr("id" , "quantity");
  $quantitySpan = $("<span></span>").addClass(name.split(' ').join(''));
  $quantitySpan.text( quantity );//set quantity value
  $trashSpanTag = $("<span></span>").addClass("glyphicon glyphicon-trash");
  $trashSpanTag.attr("aria-hidden" , "true");
  $product_namePTag = $("<p></p>");
  $product_namePTag.text(name);

  // make relationship
  $badgeSpanTag.append($quantitySpan);
  $badgeSpanTag.append($trashSpanTag);
  $newli.append($badgeSpanTag);
  $newli.append($product_namePTag);
  $container.append($newli);

  // $("<ul class="list-group">
  //   <li class="list-group-item">
  //   <span class="badge">14
  //     <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
  //   </span>
  //     prouct_name
  //   </li>");

};


var infowindow = new google.maps.InfoWindow();
var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var labelIndex = 0;
var myLatLng = {
  lat: -33.8660109,
  lng: 151.2054294
};

var initMap = function() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: myLatLng
  });
};

console.log("HELLO");
var baseUrl = "https://api.foursquare.com/v2/venues/search?";
console.log(baseUrl);

var searchFourSquareApi = function(term) {
  $.ajax({
    url: baseUrl,
    type: "GET",
    data: {
      client_id: 'QA2BISLYURA3BPTIRNSERGJQDDI1WGKMOJVOALDI3NTCSGCC',
      client_secret: 'T5NSVVT5YRSL4KCPQ3V52XW4JNEWJJBFOFIQULSYHSBKI2RE',
      oauth_token: "N4BK4CQXX13GV5QSPNRXGGR0CYPRCGJIMJCEDIK1SRIYFVXJ",
      v: "20160920",
      query: term,
      format: "json",
      //ll:"-33.8660109,151.2054294",
      ll: "-33.86,151.20",
      limit: 20,
      radius: 10000,
      sortByDistance: 1,
      openNow: true,
      nojsoncallback: true
    }
  }).done(function(data) {

    handleSearchData(data);
  });
};

var handleSearchData = function(data) {
  // console.log(data.response.venues);
  var allVenues = data.response.venues;
  for (var i = 0; i < allVenues.length; i += 1) {
    var singleVenue = allVenues[i];
    var lat = singleVenue.location.lat;
    var lng = singleVenue.location.lng;
    console.log(singleVenue);

    var description = singleVenue.name;
    console.log(description);
    console.log(lat);
    console.log(lng);
    var mySingleLatLng = {
      lat: lat,
      lng: lng
    };
    //addMarker(mySingleLatLng,map,description);
  }

};


$(document).ready(function() {
  //searchFourSquareApi("food shops");
  initMap();
  var shopLatLng = $('#shoplatlng').text();
  var shopName = $('#shopName').text();
  if (shopLatLng != 'null' && shopLatLng != 'null') {
    var shopLatAndLang = shopLatLng.split(",");
    var myShopSingleLatLng = {
      lat: Number(shopLatAndLang[0]),
      lng: Number(shopLatAndLang[1])
    };
    addMarker(myShopSingleLatLng, map, shopName);
  }
});

function addMarker(location, map, description) {
  // Add the marker at the clicked location, and add the next-available label
  // from the array of alphabetical characters.
  var marker = new google.maps.Marker({

    position: location,
    label: labels[labelIndex++ % labels.length],
    map: map
  });
  var markerNumber = 1;

  google.maps.event.addListener(marker, 'click', (function(marker, markerNumber) {
    return function() {
      infowindow.setContent(description);
      infowindow.open(map, marker);
    };
  })(marker, markerNumber));

}
