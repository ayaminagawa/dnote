// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree ../../../vendor/assets/javascripts/.
//= require_directory .

// application_jquery.js
function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").remove();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}

$(function() {
  $(document).on("keypress", "input:not(.allow_submit)", function(event) {
    return event.which !== 13;
  });
});

$(function() {
$("input:text").keypress(function(e) {
if (e.which == 13) { // Enterキーの場合
// input type="text"の配列を作成
var textArry = $("input:text");
for (var i = 0 ; i < textArry.length ; ++i) {


// Enterキーが押されたテキストボックスだった場合
if (this == textArry[i]) {

var tab_index = 0; //テキストボックス配列のインデックス
// イベントが起きたテキストボックスが配列の最後以外の場合
if (i + 1 != textArry.length) {
tab_index = i + 1; // インデックスをプラス1する
}

// フォーカスを移動
textArry[tab_index].focus();
return;
}
}
}
});
});
