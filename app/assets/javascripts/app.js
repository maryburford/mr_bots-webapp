$(document).ready(function(){
  $(".btn").click(function(){
    $(this).find("i").addClass("fa-spin");
  });
    $('[data-toggle="popover"]').popover()
});
