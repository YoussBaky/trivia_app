import 'package:flutter/material.dart';
import 'package:trivia_app/API/constants.dart';
import 'package:trivia_app/Models/categoryModel.dart';
import 'package:trivia_app/quiz.dart';

class OptionsDialog extends StatefulWidget {
  OptionsDialog({Key key, this.category}) : super(key: key);
  final CategoryClass category;
  @override
  _OptionsDialogState createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  int questionAmount;
  String questionDifficulty;
  void initState() {
    // TODO: implement initState
    super.initState();
    questionAmount = API_QUESTIONS_AMOUNT[0];
    questionDifficulty = API_QUESTIONS_DIFFICULTY[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey,
            child: Text(
              widget.category.name,
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Select Difficulty"),
          ),
          _questionDifficulty(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Select Total Number of Questions"),
          ),
          _questionAmount(),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: RaisedButton(
              color: Colors.green,
              child: Text(
                "Start Quiz",
                textScaleFactor: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Quiz();
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Wrap _questionDifficulty() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      runSpacing: 13.0,
      spacing: 13.0,
      children: List.generate(
        API_QUESTIONS_DIFFICULTY.length,
        (index) {
          return SizedBox(
            child: ActionChip(
              label: Text(API_QUESTIONS_DIFFICULTY[index]),
              labelStyle: TextStyle(color: Colors.white),
              backgroundColor:
                  questionDifficulty == API_QUESTIONS_DIFFICULTY[index]
                      ? Colors.green
                      : Colors.grey,
              onPressed: () =>
                  _selectQuestionsDifficulty(API_QUESTIONS_DIFFICULTY[index]),
            ),
          );
        },
      ),
    );
  }

  _selectQuestionsDifficulty(String difficulty) {
    setState(() {
      questionDifficulty = difficulty;
    });
  }

  Wrap _questionAmount() {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      runSpacing: 16.0,
      spacing: 16.0,
      children: List.generate(
        API_QUESTIONS_AMOUNT.length,
        (index) {
          return SizedBox(
            child: ActionChip(
              label: Text(API_QUESTIONS_AMOUNT[index].toString()),
              labelStyle: TextStyle(color: Colors.white),
              backgroundColor: questionAmount == API_QUESTIONS_AMOUNT[index]
                  ? Colors.green
                  : Colors.grey,
              onPressed: () =>
                  _selectQuestionsAmount(API_QUESTIONS_AMOUNT[index]),
            ),
          );
        },
      ),
    );
  }

  _selectQuestionsAmount(int amount) {
    setState(() {
      questionAmount = amount;
    });
  }
}
