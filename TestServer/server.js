var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "POST, GET");
  next();
})

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var tutorials = [
  {
    id: 1,
    title: "SwiftUI Beginner Tutorial On iOS 13",
    description: "Build your first app using Apple's brand new framework SwiftUI.",
    iframe: "https://www.youtube.com/embed/wwDAvq9MZlQ",
    thumbnail: "https://techrocks.ru/wp-content/uploads/2017/09/swift.jpg"
  },
  {
    id: 2,
    title: "Android Studio Tutorial For Beginners - How To Build an Android App",
    description: "In this Android Studio tutorial for beginners you'll learn how to build an Android app.",
    iframe: "https://www.youtube.com/embed/F-k5gwz_91o",
    thumbnail: "https://media.publika.md/ru/image/201808/full/android_thumb800_48786100.jpg"
  }
];

var comments = {};

app.get('/tutorials', function(req, res) {
  console.log("GET tutorials from server");
  res.send(tutorials);
})

app.get('/comments/:id', function(req, res) {
  console.log("GET comments from server");
  var id = req.params.id
  res.send(comments[id]);
})

app.post('/comments/:id', function(req, res) {
    var comment = req.body;
    var id = req.params.id;
    console.log("Parameter:", id);

    if(comment) {
        if (comment.username && comment.text) {
          if (!comments[id]) {
            comments[id] = [];
          }
          comments[id].push(comment);
          console.log(comments);
        } else {
            res.send("You posted invalid data");
        }
    } else {
        res.send("You posted an empty comment");
    }

    res.send("Successfully posted a comment");
})

app.listen(6060);
