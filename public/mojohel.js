$(document).ready(function(){

$("#convert").click(function(){
    source = $("#source").html();
    $.ajax({
    url: 'http://localhost:3000/convert',
    type: 'POST',
    data: {
        html: source,
    },
    dataType: 'json'
    })
    .done(function( data ) {
       $("#ep").html(data.ep);
    })
    .fail(function( data ) {
       $("#ep").html("fail");
    })
    .always(function( data ) {
        // ...
    });

});
});
 