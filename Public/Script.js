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
        elem.innerHTML += '<p class="myClass">ID: ' + obj.userid +  ', EMail: ' + obj.email + ', UserName: ' + obj.username + '</p>';
      }
    });
  }
}

$(document).ready(function(){
  $('#myDiv').on('click', '#myButton', myRequest);
});
