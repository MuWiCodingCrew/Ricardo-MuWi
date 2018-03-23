var express = require('express');
var path = require('path');
var databaseHandler = require('./databaseHandler');
var bodyParser = require('body-Parser');
var fs = require('fs');
var app = express();

app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());

app.post("/test",function(req, res){
  databaseHandler.sql("SELECT * FROM tuser WHERE UserID = " + req.body.message + ";", function(data){
    var myObj = {
      userid: data[0].UserID,
      email: data[0].EMail,
      username: data[0].UserName
    }
    res.send(JSON.stringify(myObj));
  })
});

app.listen(3000);
