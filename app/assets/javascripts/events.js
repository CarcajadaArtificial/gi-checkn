$(function(){
  $(".edit-activity").on('click', function(){
    var activityid = $(this).data("id");
    var method = 'GET';
    var action = '/activities/' + activityid + '/edit';

    $.ajax({
      method: method,
      url: action,
      dataType: 'script',
      data: {id: activityid},
      error: function() {
        alert('mal');
      }
      });

  });
});
