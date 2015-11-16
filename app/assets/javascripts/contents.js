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
          // $('.post').last().append(template(content))
          // $(".grid").append(template(content)).masonry( 'reload' );
          $( '.grid' ).append( template(content) );
          $( '.grid' ).masonry( 'layout' );
          $( '.grid' ).masonry( 'reloadItems' );
       
        })
      });
    };
  });

  var bottomOfPage = function(){
    return $(window).scrollTop() === $(document).height() - $(window).height()
  }
});

     

    
 
