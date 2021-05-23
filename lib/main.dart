import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizzBrain = QuizBrain();

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> scoreKeeper = [];

  List<bool> answers = [true, false, false, true];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizzBrain.getCoorrectAnswer();

    if (userPickedAnswer == correctAnswer) {
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }

    setState(() {
      quizzBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              quizzBrain.getQuestionEnunciated(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            checkAnswer(true);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            checkAnswer(false);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'False',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(children: scoreKeeper),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
