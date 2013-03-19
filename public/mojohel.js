function htmlUnescape(html)
{
  html = html.replace(/</g, '&amp;lt;').replace(/>/g, '&amp;gt;');
  html = html.replace(/\"/g, '&amp;quot;').replace(/\'/g, '&amp;#39;');
  var div = document.createElement('div');
  div.innerHTML = '<pre>' + html + '</pre>';
  return div.textContent !== undefined ? div.textContent : div.innerText;
}

$(document).ready(function(){

$("#convert").click(function(){
    source = $("#render").val();
    $.ajax({
    url: '/convert',
    type: 'POST',
    data: {
        html: source,
    },
    dataType: 'json'
    })
    .done(function( data ) {
//       $("#ep").text(data.ep);
       $("#ep").text(htmlUnescape(data.ep));
    })
    .fail(function( data ) {
       $("#ep").html("fail");
    })
    .always(function( data ) {
        // ...
    });

});
});
 
