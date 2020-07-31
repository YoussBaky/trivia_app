import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:trivia_app/Models/category.dart';
import 'package:trivia_app/API/requests.dart';

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
          brightness: Brightness.dark),
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
  Future<Gategory> futureCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategory = fetchCategorys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home(),
    );
  }
}

class home extends StatelessWidget {
  const home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              //color: Colors.red,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 280),
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        delegate: SliverChildBuilderDelegate(
                          _buildCategoryItem,
                          childCount: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                Card(
                  elevation: 8,
                  child: Container(
                    width: 300,
                    height: 170,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Correct Answers',
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '3/10',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Incorrect Answers',
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    '3/10',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textScaleFactor: 1.5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        new CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 10.0,
                          animation: true,
                          percent: 0.7,
                          backgroundColor: Colors.red,
                          center: new Text(
                            "70.0%",
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          footer: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: new Text(
                              "Your best Score",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: CircleAvatar(
                      radius: 40.0 - 2,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.pink,
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const ListTile(
              trailing: Icon(Icons.album, size: 20),
              title: Text('General Knowledge',
                  style: TextStyle(color: Colors.white)),
              //subtitle: Text('', style: TextStyle(color: Colors.white)),
            ),
            FlatButton(
              child: const Text(
                'Play',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
