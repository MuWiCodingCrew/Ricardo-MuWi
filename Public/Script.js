function myRequest(){

  var myData = {
    title: "MSG",
    message: $('#myInput').val()
  }

  if(myData.message != ""){
    $.ajax({
      type: 'POST',
      data: JSON.stringify(myData),
      contentType: 'application/json',
      url: 'http://localhost:3000/test',
      success: function(data){
        var obj = JSON.parse(data)
        var elem = document.getElementById('myDiv');
        elem.innerHTML += '<p class="myClass">ID: ' + obj.userid +  ', EMail: ' + obj.email + '</p>';
      }
    });
  }
}

$(document).ready(function(){
  $('#myDiv').on('click', '#myButton', myRequest);
});


function DatabaseLetsGo(){
  var obj = {
    chapter: "Einführung in das digitale Zeitalter"
  }

  $.ajax({
    type: 'POST',
    data: JSON.stringify(obj),
    contentType: 'application/json',
    url: 'http://localhost:3000/tag'
  })
}
