import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questions = [
    Question(
        enunciated: 'Taylor Swift wrote a book when she was a teenager',
        correctAnswer: true),
    Question(enunciated: 'Taylor Swift owns two cats.', correctAnswer: false),
    Question(enunciated: 'Taylor Swift hates horses.', correctAnswer: false),
    Question(
        enunciated:
            '"Kiss Me" was the first song Taylor Swift learned to play on guitar.',
        correctAnswer: true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionEnunciated() {
    return _questions[_questionNumber].enunciated;
  }

  bool getCoorrectAnswer() {
    return _questions[_questionNumber].correctAnswer;
  }
}
