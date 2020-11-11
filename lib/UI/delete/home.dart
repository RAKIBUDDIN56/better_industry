// import 'package:flutter/material.dart';

// import 'package:hello_world/UI/ashvini/contribution.dart';

// import 'package:hello_world/UI/ashvini/track.dart';
// import 'package:hello_world/UI/idea3.dart';
// import 'package:hello_world/UI/MyLibrary.dart';
// import 'package:hello_world/UI/pirathi/forum.dart';
// import 'package:hello_world/UI/pirathi/quizlevel.dart';

// import 'package:hello_world/UI/sutharshan/more_apps.dart';

// class Home extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return new HomeState();
//   }
// }

// class HomeState extends State<Home> {
//   int count = 0;
//   void getMoney() {
//     //setState is called each time we need to update the ui
//     setState(() {
//       count = count + 100;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: Center(child: Text("Home")),
//         backgroundColor: Colors.blueAccent,
//         actions: <Widget>[
//           new IconButton(icon: new Icon(Icons.search), onPressed: getMoney),
//           new IconButton(
//               icon: new Icon(Icons.menu), onPressed: () => debugPrint("Hey"))
//         ],
//       ),
//       body: new Container(
//         child: new Column(
//           children: <Widget>[
//             new Center(
//                 child: Image(
//               image: AssetImage("images/appicon.png"),
//               width: 200.0,
//             )),
//             new Container(
//                 color: Colors.blueGrey,
//                 child: new Row(children: [
//                   InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Ideas3()),
//                         );
//                       },
//                       child: Image(
//                         image: AssetImage("images/learn2.jpg"),
//                         width: 130.0,
//                       )),
//                   InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Ideas3()),
//                         );
//                       },
//                       child: Image(
//                         image: AssetImage("images/ideahome.jpg"),
//                         width: 130.0,
//                         height: 120.0,
//                       )),
//                   InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Ideas3()),
//                         );
//                       },
//                       child: Image(
//                         image: AssetImage("images/dev.png"),
//                         width: 150.0,
//                         height: 140.0,
//                       )),
//                 ])),
//             new Expanded(
//                 child: new Center(
//                     child: new FlatButton(
//                         color: Colors.lightGreen,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Ideas3()),
//                           );
//                         },
//                         child: new Text(
//                           "Idea",
//                           style: new TextStyle(fontSize: 19.9),
//                         )))),
//             new Expanded(
//                 child: new Center(
//                     child: new FlatButton(
//                         color: Colors.lightGreen,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MyLibrary()),
//                           );
//                         },
//                         child: new Text(
//                           "Library",
//                           style: new TextStyle(fontSize: 19.9),
//                         )))),
//             new Expanded(
//                 child: new Center(
//                     child: new FlatButton(
//                         color: Colors.lightGreen,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => track()),
//                           );
//                         },
//                         child: new Text(
//                           "Tack",
//                           style: new TextStyle(fontSize: 19.9),
//                         )))),
//             new Expanded(
//                 child: new Center(
//                     child: new FlatButton(
//                         color: Colors.lightGreen,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => contribution()),
//                           );
//                         },
//                         child: new Text(
//                           "Contribution",
//                           style: new TextStyle(fontSize: 19.9),
//                         )))),
//             new Expanded(
//                 child: new Center(
//                     child: new FlatButton(
//                         color: Colors.lightGreen,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => QuizLevel()),
//                           );
//                         },
//                         child: new Text(
//                           "Quizz",
//                           style: new TextStyle(fontSize: 19.9),
//                         )))),
//             new Expanded(
//                 child: new Center(
//                     child: new FlatButton(
//                         color: Colors.lightGreen,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => MyApp()),
//                           );
//                         },
//                         child: new Text(
//                           "My App",
//                           style: new TextStyle(fontSize: 19.9),
//                         )))),
//             new Expanded(
//                 child: new Center(
//                     child: new FlatButton(
//                         color: Colors.lightGreen,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Forum()),
//                           );
//                         },
//                         child: new Text(
//                           "Chat",
//                           style: new TextStyle(fontSize: 19.9),
//                         ))))
//           ],
//         ),
//       ),
//       bottomNavigationBar: new BottomNavigationBar(
//         items: [
//           new BottomNavigationBarItem(
//               icon: new Icon(Icons.add), title: new Text("Hey")),
//           new BottomNavigationBarItem(
//               icon: new Icon(Icons.call), title: new Text("Hey")),
//           new BottomNavigationBarItem(
//               icon: new Icon(Icons.print), title: new Text("Hey")),
//         ],
//         onTap: (int i) => debugPrint("Hey touched $i"),
//       ),
//     );
//   }
// }
