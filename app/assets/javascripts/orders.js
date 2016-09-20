$(document).on("turbolinks:load", function (){
  $(".order_name").on("click" , function(e){
    //prevent submit event
    getListItem(e.currentTarget.innerHTML);
  });
});


var getListItem = function( name ){

  // $.ajax({
  //   // url: "/line
  //   ",
  //   type: "GET",
  //   dataType: "JSON"
  // }).done( );
};
