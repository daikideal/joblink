//Room遷移時最下部スクロール処理
$(function(){
  $("html,body").animate({scrollTop:$('#speaker').offset().top});
});

//送信ボタンのツールチップ
$(document).ready(function(){
  $('.tooltipped').tooltip();
});