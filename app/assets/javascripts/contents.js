$(document).ready(function(){
  var next_page = 2;

  $('.grid').masonry({
    itemSelector: '.grid-item',
    columnWidth: 200,
    isFitWidth: true
  });

  $(window).scroll(function(){
    if (bottomOfPage()){
      var ajaxRequest = $.ajax({
        dataType: 'json',
        url: "contents/?page=" + next_page,
        type: "Get",
      });
      ajaxRequest.success(function(response){
        next_page += 1
    
        var source = $('#entry-template').html();
        var template = Handlebars.compile(source);

        response.forEach(function(content){

          content.title = truncated(content.title);
          content.blurb = truncated(content.blurb);

          $('.grid').append(template(content));
          $('.grid').masonry('reloadItems');  
          $('.grid').masonry('layout');
        })
      });
    };
  });

  var bottomOfPage = function(){
    return $(window).scrollTop() === $(document).height() - $(window).height();
  };

  var truncated = function(text){
    return text.split(" ").slice(0, 32).join(" ");
  };

  $('.posts').on('mouseenter', '.post', function() {
    $(this).addClass("hover");
  }).on('mouseleave', '.post', function() {
    $(this).removeClass("hover");
  });
});

     

    
 
