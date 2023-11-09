import 'package:flutter/material.dart';
import 'package:quizzler_app/question.dart';
import 'quiz_brain.dart';


QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
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
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  // List<Question> questionBank = [
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true),
  // ];


  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                bool correctAnswer = quizBrain.getCorrectAnswer();
                if(correctAnswer == true){
                  print('correct');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                }else{
                  print('wrong');
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                setState(() {

                  quizBrain.nextQuestion();

                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                'true',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                bool correctAnswer = quizBrain.getCorrectAnswer();
                if(correctAnswer == true){
                  print('correct');
                }else{
                  print('wrong');
                }
                setState(() {
                  scoreKeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                  quizBrain.nextQuestion();
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                'false',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper),
      ],
    );
  }
}
