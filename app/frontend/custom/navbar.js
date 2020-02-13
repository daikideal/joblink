//navbarのドロップダウン処理
$( document ).ready(function(){
  $(".dropdown-trigger").dropdown();
});

//sidenavのスライド処理
$(document).ready(function(){
  $('.sidenav').sidenav(
    {
      edge: 'right'
    }
  );
});