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

  $('input[type="text"]').keydown(function(){
    $.ajax({
      url: $(this).data("update-url"),
      method: "post",
      data: {name: $(this).attr("name"), value: $(this).val()}
    }).error(function(data){
      console.log('ajax error');
    });
  });

});