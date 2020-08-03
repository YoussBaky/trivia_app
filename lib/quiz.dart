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

// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// class Quiz extends StatefulWidget {
//   @override
//   _CountDownTimerState createState() => _CountDownTimerState();
// }

// class _CountDownTimerState extends State<Quiz> with TickerProviderStateMixin {
//   AnimationController controller;

//   String get timerString {
//     Duration duration = controller.duration * controller.value;
//     return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);
//     return Scaffold(
//       backgroundColor: Colors.white10,
//       body: AnimatedBuilder(
//         animation: controller,
//         builder: (context, child) {
//           return Stack(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   color: Colors.amber,
//                   height: controller.value * MediaQuery.of(context).size.height,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Expanded(
//                       child: Align(
//                         alignment: FractionalOffset.center,
//                         child: AspectRatio(
//                           aspectRatio: 1.0,
//                           child: Stack(
//                             children: <Widget>[
//                               Positioned.fill(
//                                 child: CustomPaint(
//                                     painter: CustomTimerPainter(
//                                   animation: controller,
//                                   backgroundColor: Colors.white,
//                                   color: Colors.blue,
//                                 )),
//                               ),
//                               Align(
//                                 alignment: FractionalOffset.center,
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "Count Down Timer",
//                                       style: TextStyle(
//                                           fontSize: 20.0, color: Colors.white),
//                                     ),
//                                     Text(
//                                       timerString,
//                                       style: TextStyle(
//                                           fontSize: 112.0, color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     AnimatedBuilder(
//                         animation: controller,
//                         builder: (context, child) {
//                           return FloatingActionButton.extended(
//                               onPressed: () {
//                                 if (controller.isAnimating)
//                                   controller.stop();
//                                 else {
//                                   controller.reverse(
//                                       from: controller.value == 0.0
//                                           ? 1.0
//                                           : controller.value);
//                                 }
//                               },
//                               icon: Icon(controller.isAnimating
//                                   ? Icons.pause
//                                   : Icons.play_arrow),
//                               label: Text(
//                                   controller.isAnimating ? "Pause" : "Play"));
//                         }),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class CustomTimerPainter extends CustomPainter {
//   CustomTimerPainter({
//     this.animation,
//     this.backgroundColor,
//     this.color,
//   }) : super(repaint: animation);

//   final Animation<double> animation;
//   final Color backgroundColor, color;

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = backgroundColor
//       ..strokeWidth = 10.0
//       ..strokeCap = StrokeCap.butt
//       ..style = PaintingStyle.stroke;

//     canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
//     paint.color = color;
//     double progress = (1.0 - animation.value) * 2 * math.pi;
//     canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
//   }

//   @override
//   bool shouldRepaint(CustomTimerPainter old) {
//     return animation.value != old.animation.value ||
//         color != old.color ||
//         backgroundColor != old.backgroundColor;
//   }
// }
