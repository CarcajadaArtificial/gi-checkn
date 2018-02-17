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

  $(".selected").change(function() {
    var amount = $(this).data("amount");
    var $cs = $(this).parent().parent().find(":checked");
    console.log($cs.length)
     if ($cs.length > amount) {
        console.log("hola");
        this.checked = false;
     }
  });

  $('#database').DataTable();

});
