$(document).on("turbolinks:load", function (){
  $(".order_name").on("click" , function(e){
    debugger;
    //prevent submit event
    getListItem(e.currentTarget.innerHTML);
  });
});


var getListItem = function( name ){

  $.ajax({
    url: baseFlickrURL ,
    type: "GET" ,
    data: {
      method: "flickr.photos.search" ,
      api_key: API_KEY ,
      text: term ,
      format: "json" ,
      nojsoncallback: true
    }
  }).done( handleSearchData );
};
