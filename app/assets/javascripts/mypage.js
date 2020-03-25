$(function()  {
  let tabs = $(".menu-item");
  function tabSwitch() {
    $('.active').removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".content").removeClass("hidden").eq(index).addClass("hidden");
  }
  tabs.click(tabSwitch);    
});