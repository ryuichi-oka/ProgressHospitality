$(document).on('turbolinks:load', function() {
  $(".menu-trigger").click(function () {
      $(this).toggleClass('active');
      $('#sp-menu').toggleClass('panelactive');
  });
  $("#sp-menu a").click(function () {//ナビゲーションのリンクがクリックされたら
    $(".menu-trigger").removeClass('active');//ボタンの activeクラスを除去し
    $("#sp-menu").removeClass('panelactive');//ナビゲーションのpanelactiveクラスも除去
  });
})

