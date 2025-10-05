import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const MultiplicationGame());
}

class MultiplicationGame extends StatelessWidget {
  const MultiplicationGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multiplication Game',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const GamePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Random _random = Random();
  int num1 = 1;
  int num2 = 1;
  int grade = 1;
  int questionCount = 0;
  int correctCount = 0;
  int wrongCount = 0;
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String feedback = "";

  int timeLeft = 10;
  Timer? _timer;
  bool isTimeUp = false;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    switch (grade) {
      case 1: // 1-5 × 1-5
        num1 = _random.nextInt(5) + 1;
        num2 = _random.nextInt(5) + 1;
        break;
      case 2: // 1-9 × 1-9
        num1 = _random.nextInt(9) + 1;
        num2 = _random.nextInt(9) + 1;
        break;
      case 3: // 2-9 × 2-9
        num1 = _random.nextInt(8) + 2;
        num2 = _random.nextInt(8) + 2;
        break;
      case 4: // 10-19 × 2-9
        num1 = _random.nextInt(10) + 10;
        num2 = _random.nextInt(8) + 2;
        break;
      case 5: // 10-19 × 10-19
        num1 = _random.nextInt(10) + 10;
        num2 = _random.nextInt(10) + 10;
        break;
      case 6: // 20-49 × 2-9
        num1 = _random.nextInt(30) + 20;
        num2 = _random.nextInt(8) + 2;
        break;
      case 7: // 20-49 × 10-19
        num1 = _random.nextInt(30) + 20;
        num2 = _random.nextInt(10) + 10;
        break;
      case 8: // 50-99 × 10-19
        num1 = _random.nextInt(50) + 50;
        num2 = _random.nextInt(10) + 10;
        break;
      case 9: // 50-99 × 20-49
        num1 = _random.nextInt(50) + 50;
        num2 = _random.nextInt(30) + 20;
        break;
      case 10: // 100-199 × 2-9
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(8) + 2;
        break;
      case 11: // 100-199 × 10-19
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(10) + 10;
        break;
      case 12: // 100-199 × 20-49
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(30) + 20;
        break;
      case 13: // 100-199 × 50-99
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(50) + 50;
        break;
      case 14: // 100-999 × 10-99
        num1 = _random.nextInt(900) + 100;
        num2 = _random.nextInt(90) + 10;
        break;
      case 15: // 100-999 × 100-999
        num1 = _random.nextInt(900) + 100;
        num2 = _random.nextInt(900) + 100;
        break;
      case 16: // 1000-1999 × 100-999
        num1 = _random.nextInt(1000) + 1000;
        num2 = _random.nextInt(900) + 100;
        break;
      case 17: // 1000-1999 × 1000-1999
        num1 = _random.nextInt(1000) + 1000;
        num2 = _random.nextInt(1000) + 1000;
        break;
      case 18: // 2000-4999 × 1000-1999
        num1 = _random.nextInt(3000) + 2000;
        num2 = _random.nextInt(1000) + 1000;
        break;
      case 19: // 2000-4999 × 2000-4999
        num1 = _random.nextInt(3000) + 2000;
        num2 = _random.nextInt(3000) + 2000;
        break;
      case 20: // 5000-9999 × 5000-9999
        num1 = _random.nextInt(5000) + 5000;
        num2 = _random.nextInt(5000) + 5000;
        break;
      default:
        num1 = _random.nextInt(5) + 1;
        num2 = _random.nextInt(5) + 1;
    }
    _answerController.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _focusNode.requestFocus();
    });
    _startTimer();
  }

  void _checkAnswer() {
    if (_answerController.text.isEmpty || isTimeUp) return;
    _timer?.cancel();
    int userAnswer = int.tryParse(_answerController.text) ?? 0;
    int correctAnswer = num1 * num2;

    setState(() {
      questionCount++;
      if (userAnswer == correctAnswer) {
        correctCount++;
        feedback = "✅ Correct!";
      } else {
        wrongCount++;
        feedback = "❌ Oops! Correct: $correctAnswer";
      }

      if (questionCount == 10) {
        _showLevelResult();
      } else {
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) setState(() => feedback = "");
          _generateQuestion();
        });
      }
    });
  }

  void _showLevelResult() async {
    String resultMsg;
    if (correctCount >= 7 && grade < 20) {
      grade++;
      resultMsg = "Great job! You advance to Grade $grade.";
    } else if (correctCount < 4 && grade > 1) {
      grade--;
      resultMsg = "Try again! You go back to Grade $grade.";
    } else if (grade == 20) {
      resultMsg = "Congratulations! You've reached the highest grade!";
    } else {
      resultMsg = "You stay at Grade $grade.";
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Level Complete"),
        content: Text(
            "Correct: $correctCount\nWrong: $wrongCount\n\n$resultMsg"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                questionCount = 0;
                correctCount = 0;
                wrongCount = 0;
                feedback = "";
                _generateQuestion();
              });
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }

  void _resetGame() {
    _timer?.cancel();
    setState(() {
      grade = 1;
      questionCount = 0;
      correctCount = 0;
      wrongCount = 0;
      feedback = "";
      _generateQuestion();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    timeLeft = _getTimeLimit();
    isTimeUp = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        setState(() {
          isTimeUp = true;
          wrongCount++;
          feedback = "⏰ Time's up! Correct: ${num1 * num2}";
          questionCount++;
        });
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) setState(() => feedback = "");
          if (questionCount == 10) {
            _showLevelResult();
          } else {
            _generateQuestion();
          }
        });
      }
    });
  }

  int _getTimeLimit() {
    if (grade <= 5) return 10;
    if (grade <= 10) return 15;
    if (grade <= 15) return 20;
    return 25;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90, // Increase the height of the AppBar
        title: const Padding(
          padding: EdgeInsets.only(top: 20), // Add space above the title
          child: Text(
            "Multiplication Game",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Grade $grade",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Question: ${questionCount + 1}/10",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  "Correct: $correctCount   Wrong: $wrongCount",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  "Time Left: $timeLeft s",
                  style: TextStyle(
                    fontSize: 18,
                    color: timeLeft <= 3 ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "$num1 × $num2 = ?",
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 180, // Reduced width
                  child: TextField(
                    key: const Key('answerField'),
                    controller: _answerController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Your Answer",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _checkAnswer(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: const Key('checkButton'),
                  onPressed: _checkAnswer,
                  child: const Text("Check"),
                ),
                const SizedBox(height: 20),
                Text(
                  feedback,
                  key: const Key('feedbackText'),
                  style: TextStyle(
                    fontSize: 20,
                    color: feedback.startsWith("✅") ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
