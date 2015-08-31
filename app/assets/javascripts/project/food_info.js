$(function(){
  $('input[type="checkbox"]').click(function(){
    var value = $(this).is(':checked') ? 1 : 0;
    $.ajax({
      url: $(this).data('check-url'),
      method: "post",
      data: {checked: value}
    }).error(function(data){
      console.log('ajax error');
    });
  });
});