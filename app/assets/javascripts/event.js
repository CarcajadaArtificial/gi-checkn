$(function(){
  $("#preregister_continue").click(function(){
    var parent = $("#preregister_continue").parent();
    parent.toggle(".dissapear");
    parent.next().removeClass("dissapear");
  });

  $("#modal_close").click(function(){
    var parent = $("#modal_close").parent();
    parent.slideToggle(".dissapear");
    parent.empty();
  });

  $("a[data-urlName]").click(function(){
    alert($(this).text());
  });
});
