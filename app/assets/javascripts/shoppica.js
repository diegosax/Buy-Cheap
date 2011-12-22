jQuery( function($) {

  var site_options = {
    'main_color'      : '#71b013',
    'secondary_color' : '#ff9900'      
  };

  // Hover effect for the header menu
  $("#categories > ul > li").not("#menu_home").hover(
    function() {
        $(this).find("a:first").stop().animate({
          color: '#ffffff',
          backgroundColor: site_options.secondary_color
        },300
      );
    }
    ,
    function() {
      $(this).find("a:first").stop().animate({
          color: site_options.secondary_color,
          backgroundColor: '#ffffff'
        },300
      );
    }
  );

  

  // Hover effect for the shoppica cart
  $("#cart_menu").hover(
    function() {
      $(this).find(".s_grand_total").stop().animate({
          color: '#ffffff',
          backgroundColor: site_options.main_color
        },300
      );
    }
    ,
    function() {
      $(this).find(".s_grand_total").stop().animate({
          color: site_options.main_color,
          backgroundColor: '#ffffff'
        },300
      );
    }
  );

});