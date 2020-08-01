import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:trivia_app/category.dart';

import 'Components/best_score_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            fit: StackFit.passthrough,
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              BuildCategory(),
              Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                overflow: Overflow.visible,
                children: <Widget>[
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      //margin: EdgeInsets.only(top: 18),
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 18,
                    child: Text(
                      'Welcome Back',
                      textScaleFactor: 2,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  buildCard(),
                  Positioned(
                    bottom: -30,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: CircleAvatar(
                        radius: 40.0 - 2,
                        backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
