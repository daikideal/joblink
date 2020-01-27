//avatar画像選択時のプレビュー表示処理
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#avatar_prev').attr({
          src: e.target.result,
          class: 'circle',
          width: 200,
          height: 200,
          style: 'object-fit: cover;'
        });
    }
    reader.readAsDataURL(input.files[0]);
    }
  }
  $("#avatar_img").change(function(){
    readURL(this);
  });
});

//header画像選択時のプレビュー表示処理
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#header_prev').attr({
          src: e.target.result,
          width: 1000,
          height: 500,
          style: 'object-fit: cover;'
        });
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#header_img").change(function(){
    readURL(this);
  });
});

//Resume編集画面のヘルプリストの表示処理
$(document).ready(function(){
  $('.collapsible').collapsible();
});