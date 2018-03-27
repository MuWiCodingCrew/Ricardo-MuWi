var express = require('express');
var path = require('path');
var databaseHandler = require('./databaseHandler');
var bodyParser = require('body-Parser');
var fs = require('fs');
var app = express();
var ContentAssociation = require('./ContentAssociation');

app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());

app.post("/test",function(req, res){
  databaseHandler.sql("SELECT * FROM tuser WHERE UserID = " + req.body.message + ";", function(data){
    var myObj = {
      userid: data[0].UserID,
      email: data[0].EMail,
    }
    res.send(JSON.stringify(myObj));
  })
});

app.post("/tag", function (req, res) {
    databaseHandler.sql("SELECT a.* FROM (((tcontent AS a INNER JOIN tContentAffiliation AS b ON a.ContentID = b.ContentID) INNER JOIN tlist as c ON b.ListID = c.ListID) RIGHT JOIN tchapter as d ON c.ChapterID = d.ChapterID) WHERE d.title = '" + req.body.chapter + "';", function (data) {
        console.log(data);
    });
})

app.listen(3000);
