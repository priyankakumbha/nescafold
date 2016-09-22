$(document).ready(function() {
  $(".orderStatus").each(function(i,v) {
    var currentStatus = $(this).text().trim();
    $(this).parent().find(".status + ." + currentStatus).show();
  });
  $('#state_search').on("change", function() {
    $(this).parent().parent().find(".status").hide();
    var state = $(this).val();
    $(this).parent().parent().find("." + state).show();

    // $(this).parent().find(".alert-danger").hide();
    // console.log($(this).val());
  });
  // var text = $('.orderStatus').text();
  // console.log(text);
  // var $status = $("<td></td>");
  // console.log($status);

});
