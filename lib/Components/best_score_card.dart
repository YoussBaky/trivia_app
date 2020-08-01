import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Card buildCard() {
  return Card(
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
  );
}
