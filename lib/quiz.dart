import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Quiz extends StatefulWidget {
  Quiz({Key key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              controller.reverse(
                  from: controller.value == 0.0 ? 1.0 : controller.value);
              return Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
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
                      // Positioned(
                      //   top: 18,
                      //   child: Text(
                      //     'Welcome Back',
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //     ),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                      Positioned(
                        left: 20,
                        bottom: -18,
                        child: buildContainer(
                          '10%\nScore',
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                        ),
                      ),

                      Positioned(
                        bottom: -38,
                        child: buildContainer(
                          '',
                          Colors.red,
                          Colors.blue,
                          Colors.green,
                          borderSize: 20.0,
                        ),
                      ),
                      Positioned(
                        bottom: -38,
                        child: buildtimer(),
                      ),
                      Positioned(
                        bottom: -38,
                        child: buildContainer(
                          timerString + '\nSecond',
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                        ),
                      ),
                      Positioned(
                        right: 20,
                        bottom: -18,
                        child: buildContainer(
                          '2/10\nQuestions',
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Stack buildtimer() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            width: 75 * controller.value,
            decoration: new BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  spreadRadius: 5,
                ),
              ],
              border: Border.all(
                  width: 2,
                  style: BorderStyle.solid,
                  color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }

  Container buildContainer(
      String text, Color boxDecoration, Color boxShadow, Color border,
      {double borderSize: 2.0}) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: new BoxDecoration(
        color: boxDecoration,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: boxShadow,
            spreadRadius: 5,
          ),
        ],
        border: Border.all(
          width: borderSize,
          style: BorderStyle.solid,
          color: border,
        ),
      ),
    );
  }
}
