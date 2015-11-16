$(document).ready(function(){
  var next_page = 2;

  $('.grid').masonry({
            itemSelector: '.grid-item',
            columnWidth: 200,
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

          var truncatedBlurb = content.blurb.split(" ").slice(0,32).join(" ");

          content.blurb = truncatedBlurb

          $('.grid').append(template(content));
          debugger
          $('.grid').masonry('layout');
          $('.grid').masonry('reloadItems');  
        })
      });
    };
  });

  var bottomOfPage = function(){
    return $(window).scrollTop() === $(document).height() - $(window).height()
  }
});

     

    
 
