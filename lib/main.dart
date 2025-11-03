import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:html' as html;

void main() {
  runApp(const MultiplicationGame());
}

class MultiplicationGame extends StatelessWidget {
  const MultiplicationGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpongeBob Multiplication Game',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 800 ? screenWidth * 0.92 : 700.0;
    final welcomeImageWidth = (screenWidth * 0.6).clamp(240.0, 450.0);
    final welcomeImageHeight = welcomeImageWidth * 0.67;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade400,
              Colors.cyan.shade300,
              Colors.yellow.shade200,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: cardWidth,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.6),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
                border: Border.all(color: Colors.yellow.shade700, width: 5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title with SpongeBob style
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'SPONGEBOB',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 8
                            ..color = Colors.brown.shade800,
                        ),
                      ),
                      Text(
                        'SPONGEBOB',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow.shade600,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.orange,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'MULTIPLICATION ADVENTURE',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // SpongeBob Welcome Image
                  Container(
                    width: welcomeImageWidth,
                    height: welcomeImageHeight,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.yellow.shade600, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.4),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/spongebob_welcome.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, st) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 80, color: Colors.yellow.shade300),
                            const SizedBox(height: 10),
                            const Text(
                              'SpongeBob Welcome Image\n450x300px',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Adventure Info
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade100, Colors.cyan.shade50],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue.shade400, width: 3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bubble_chart, color: Colors.blue.shade700, size: 30),
                            const SizedBox(width: 10),
                            Text(
                              'ADVENTURE GUIDE',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(Icons.bubble_chart, color: Colors.blue.shade700, size: 30),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '🍍 Solve 10 multiplication problems per level\n'
                          '⏰ Beat the timer to advance grades\n'
                          '🏆 Get 7+ correct to level up\n'
                          '🌊 Reach Grade 20 to become a math master!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Start Button - Pineapple style
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.6),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const GamePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade600,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                        elevation: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow, size: 50, color: Colors.brown.shade800),
                          const SizedBox(height: 5),
                          Text(
                            'START',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Exit Button
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: _openWebsite,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade500,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                      icon: const Icon(Icons.exit_to_app, color: Colors.white),
                      label: const Text(
                        'EXIT TO GAMIFY',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Main Game Screen
class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
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

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  void _openWebsite() {
    html.window.open('https://hubertmucyo.github.io/gamify', '_blank');
  }

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _generateQuestion();
  }

  void _generateQuestion() {
    switch (grade) {
      case 1:
        num1 = _random.nextInt(5) + 1;
        num2 = _random.nextInt(5) + 1;
        break;
      case 2:
        num1 = _random.nextInt(9) + 1;
        num2 = _random.nextInt(9) + 1;
        break;
      case 3:
        num1 = _random.nextInt(8) + 2;
        num2 = _random.nextInt(8) + 2;
        break;
      case 4:
        num1 = _random.nextInt(10) + 10;
        num2 = _random.nextInt(8) + 2;
        break;
      case 5:
        num1 = _random.nextInt(10) + 10;
        num2 = _random.nextInt(10) + 10;
        break;
      case 6:
        num1 = _random.nextInt(30) + 20;
        num2 = _random.nextInt(8) + 2;
        break;
      case 7:
        num1 = _random.nextInt(30) + 20;
        num2 = _random.nextInt(10) + 10;
        break;
      case 8:
        num1 = _random.nextInt(50) + 50;
        num2 = _random.nextInt(10) + 10;
        break;
      case 9:
        num1 = _random.nextInt(50) + 50;
        num2 = _random.nextInt(30) + 20;
        break;
      case 10:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(8) + 2;
        break;
      case 11:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(10) + 10;
        break;
      case 12:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(30) + 20;
        break;
      case 13:
        num1 = _random.nextInt(100) + 100;
        num2 = _random.nextInt(50) + 50;
        break;
      case 14:
        num1 = _random.nextInt(900) + 100;
        num2 = _random.nextInt(90) + 10;
        break;
      case 15:
        num1 = _random.nextInt(900) + 100;
        num2 = _random.nextInt(900) + 100;
        break;
      case 16:
        num1 = _random.nextInt(1000) + 1000;
        num2 = _random.nextInt(900) + 100;
        break;
      case 17:
        num1 = _random.nextInt(1000) + 1000;
        num2 = _random.nextInt(1000) + 1000;
        break;
      case 18:
        num1 = _random.nextInt(3000) + 2000;
        num2 = _random.nextInt(1000) + 1000;
        break;
      case 19:
        num1 = _random.nextInt(3000) + 2000;
        num2 = _random.nextInt(3000) + 2000;
        break;
      case 20:
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
        feedback = "✅ CORRECT!";
      } else {
        wrongCount++;
        feedback = "❌ WRONG! Answer: $correctAnswer";
      }

      if (questionCount == 10) {
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) _showLevelResult();
        });
      } else {
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            _generateQuestion();
          }
        });
      }
    });
  }

  void _showLevelResult() async {
    String resultMsg;
    String resultEmoji;
    Color resultColor;
    String spongebobImage;

    if (correctCount >= 7 && grade < 20) {
      grade++;
      resultMsg = "AWESOME! You advance to Grade $grade!";
      resultEmoji = "🎉";
      resultColor = Colors.yellow;
      spongebobImage = 'assets/spongebob_happy.jpg'; // Happy SpongeBob for success
    } else if (correctCount < 4 && grade > 1) {
      grade--;
      resultMsg = "Keep practicing! You return to Grade $grade.";
      resultEmoji = "💪";
      resultColor = Colors.orange;
      spongebobImage = 'assets/spongebob_sad.png'; // Sad SpongeBob for failure
    } else if (grade == 20) {
      resultMsg = "LEGENDARY! You've mastered all grades!";
      resultEmoji = "🏆";
      resultColor = Colors.amber;
      spongebobImage = 'assets/spongebob_happy.jpg'; // Happy for mastery
    } else {
      resultMsg = "Good effort! You stay at Grade $grade.";
      resultEmoji = "⭐";
      resultColor = Colors.blue;
      spongebobImage = correctCount >= 5 ? 'assets/spongebob_happy.jpg' : 'assets/spongebob_sad.jpg';
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, resultColor.withOpacity(0.2)],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: resultColor, width: 4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SpongeBob Result Image
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: resultColor, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: resultColor.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    spongebobImage,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => Icon(
                      correctCount >= 7 ? Icons.emoji_emotions : Icons.sentiment_dissatisfied,
                      size: 60,
                      color: resultColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                resultEmoji,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 10),
              Text(
                "LEVEL COMPLETE",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem("✅ Correct", correctCount, Colors.green),
                        _buildStatItem("❌ Wrong", wrongCount, Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                resultMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Exit Button
                  ElevatedButton.icon(
                    onPressed: _openWebsite,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade500,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(Icons.exit_to_app, size: 20, color: Colors.white),
                    label: const Text(
                      'EXIT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Continue Button
                  ElevatedButton(
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade600,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
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
          feedback = "⏰ TIME'S UP! Answer: ${num1 * num2}";
          questionCount++;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            if (questionCount == 10) {
              _showLevelResult();
            } else {
              _generateQuestion();
            }
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
    _pulseController.dispose();
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade400,
              Colors.cyan.shade300,
              Colors.yellow.shade200,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: isSmallScreen ? 12 : 20,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow.shade600, Colors.orange.shade400],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left character image
                  Container(
                    width: isSmallScreen ? 50 : 70,
                    height: isSmallScreen ? 50 : 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.brown.shade700, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/spongebob_character.png',
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, st) => Icon(
                          Icons.person,
                          size: isSmallScreen ? 25 : 35,
                          color: Colors.yellow.shade700,
                        ),
                      ),
                    ),
                  ),

                  // Title
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'SPONGEBOB',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 20 : 28,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = isSmallScreen ? 3 : 4
                                ..color = Colors.brown.shade800,
                            ),
                          ),
                          Text(
                            'SPONGEBOB',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 20 : 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'MULTIPLICATION',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 10 : 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade800,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),

                  // Right side: responsive exit + friend image
                  if (!isSmallScreen)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Exit Button for large screens
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: _openWebsite,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade500,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.exit_to_app, size: 16, color: Colors.white),
                            label: const Text(
                              'EXIT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        // Right character image
                        Container(
                          width: isSmallScreen ? 50 : 70,
                          height: isSmallScreen ? 50 : 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.brown.shade700, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.yellow.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/spongebob_friend.png',
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, st) => Icon(
                                Icons.star,
                                size: isSmallScreen ? 25 : 35,
                                color: Colors.pink.shade300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    // For small screens show only the exit button (compact)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: _openWebsite,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade500,
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 12 : 16,
                            vertical: isSmallScreen ? 8 : 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: Icon(Icons.exit_to_app,
                            size: isSmallScreen ? 14 : 16,
                            color: Colors.white),
                        label: Text(
                          'EXIT',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 10 : 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

              // Info Bar
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 8 : 12,
                  horizontal: 12,
                ),
                color: Colors.blue.shade700.withOpacity(0.3),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip('GRADE', '$grade', Colors.pink, isSmallScreen),
                    _buildInfoChip('Q', '${questionCount + 1}/10', Colors.cyan, isSmallScreen),
                    _buildInfoChip('✅', '$correctCount', Colors.green, isSmallScreen),
                    _buildInfoChip('❌', '$wrongCount', Colors.red, isSmallScreen),
                  ],
                ),
              ),

              // Main Content Area - Scrollable
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  child: Center(
                    child: Container(
                      width: isSmallScreen ? screenSize.width * 0.95 : 600,
                      margin: const EdgeInsets.all(16),
                      padding: EdgeInsets.all(isSmallScreen ? 20 : 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(color: Colors.yellow.shade600, width: 4),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Timer - Bubble style
                          ScaleTransition(
                            scale: timeLeft <= 3
                                ? _pulseAnimation
                                : const AlwaysStoppedAnimation(1.0),
                            child: Container(
                              padding: EdgeInsets.all(isSmallScreen ? 12 : 18),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: timeLeft <= 3
                                      ? [Colors.red, Colors.red.shade900]
                                      : [Colors.blue.shade300, Colors.blue.shade600],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (timeLeft <= 3 ? Colors.red : Colors.blue)
                                        .withOpacity(0.6),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                    size: isSmallScreen ? 30 : 40,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '$timeLeft',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 28 : 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'sec',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 10 : 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 20 : 30),

                          // Question
                          Container(
                            padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.yellow.shade100, Colors.yellow.shade200],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.orange.shade400, width: 3),
                            ),
                            child: Text(
                              '$num1 × $num2 = ?',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 36 : 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown.shade800,
                              ),
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 20 : 30),

                          // Feedback
                          if (feedback.isNotEmpty)
                            Container(
                              padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                              margin: EdgeInsets.only(bottom: isSmallScreen ? 10 : 15),
                              decoration: BoxDecoration(
                                color: feedback.contains("CORRECT") 
                                    ? Colors.green.shade100 
                                    : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: feedback.contains("CORRECT") 
                                      ? Colors.green 
                                      : Colors.red,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                feedback,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 16 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: feedback.contains("CORRECT") 
                                      ? Colors.green.shade800 
                                      : Colors.red.shade800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                          // Answer Input
                          Container(
                            width: isSmallScreen ? 180 : 220,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: TextField(
                              key: const Key('answerField'),
                              controller: _answerController,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 24 : 32,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                labelText: "Your Answer",
                                labelStyle: TextStyle(color: Colors.brown.shade700),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.yellow.shade700, width: 3),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.yellow.shade700, width: 3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.orange.shade700, width: 3),
                                ),
                              ),
                              onSubmitted: (_) => _checkAnswer(),
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 20 : 30),

                          // Submit Button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.4),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _checkAnswer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade600,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isSmallScreen ? 40 : 60,
                                  vertical: isSmallScreen ? 16 : 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: isSmallScreen ? 24 : 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: isSmallScreen ? 8 : 12),
                                  Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 18 : 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 10 : 15),

                          // Reset and Exit Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: _resetGame,
                                child: Text(
                                  'Reset Game',
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 14 : 16,
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: _openWebsite,
                                child: Text(
                                  'Exit to Gamify',
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 14 : 16,
                                    color: Colors.red.shade600,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value, Color color, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 12 : 16, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}