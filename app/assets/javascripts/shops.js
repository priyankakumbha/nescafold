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


var infowindow = new google.maps.InfoWindow();
var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var labelIndex = 0;
var myLatLng = {
  lat: -33.8660109,
  lng: 151.2054294
};

var initMap = function() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
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
            oauth_token:"N4BK4CQXX13GV5QSPNRXGGR0CYPRCGJIMJCEDIK1SRIYFVXJ",
            v:"20160920",
            query: term,
            format: "json",
            //ll:"-33.8660109,151.2054294",
            ll:"-33.86,151.20",
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

var handleSearchData = function(data){
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
        addMarker(mySingleLatLng,map,description);
}

};


$(document).ready(function() {
    searchFourSquareApi("food shops");
    initMap();
});

function addMarker(location, map,description) {
  // Add the marker at the clicked location, and add the next-available label
  // from the array of alphabetical characters.
  var marker = new google.maps.Marker({

    position: location,
    label: labels[labelIndex++ % labels.length],
    map: map
  });
  var markerNumber =1;

  google.maps.event.addListener(marker, 'click', (function(marker, markerNumber) {
          return function() {
            infowindow.setContent(description);
            infowindow.open(map, marker);
          };
    })(marker,markerNumber));


}
