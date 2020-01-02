import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/question_brain.dart';

QuestionBrain questionBrain = new QuestionBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
//  List<String> questions = [
//    "elephant can fly",
//    "Moutain everest located in Nepal",
//    "flutter is object-oriented concept",
//  ];
//  List<bool> answers = [false, true, false];

  int questionnumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBrain.questions[questionnumber].questionsText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                "True",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questionBrain.questions[questionnumber].answerResult ==
                      true) {
                    print("answer is right");
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    print("answer is wrong");
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  questionnumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                "False",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (questionBrain.questions[questionnumber].answerResult ==
                      false) {
                    print("answer is right");
                    scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    print("answer is wrong");
                    scoreKeeper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  questionnumber++;
                });
              },
            ),
          ),
        ),
        //TODO:I NEED  TO ADD SOMETHING here
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
