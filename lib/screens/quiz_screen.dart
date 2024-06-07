import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  final List<Question> _questions = sampleQuestions;
  bool _isAnswered = false;
  bool _isCorrect = false;

  void _checkAnswer(int selectedIndex) {
    setState(() {
      _isAnswered = true;
      _isCorrect = selectedIndex == _questions[_currentQuestionIndex].correctOptionIndex;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
      _isAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Color(0xFFA76AE4),
      appBar: AppBar(
         backgroundColor: Color(0xFFA76AE4),
        title: Text('Quiz'),
      ),
      body: LayoutBuilder(
        
        builder: (context, constraints) {
          double buttonWidth = constraints.maxWidth * 0.8; // 80% of the available width

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Question ${_currentQuestionIndex + 1}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                if (question.imagePath.isNotEmpty)
                  Image.asset(
                    question.imagePath,
                    height: 200,
                  ),
                SizedBox(height: 20),
                Text(
                  question.questionText,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                for (int i = 0; i < question.options.length; i++)
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: _isAnswered ? null : () => _checkAnswer(i),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('${String.fromCharCode(65 + i)}. '), // A for index 0, B for index 1, etc.
                          Expanded(child: Text(question.options[i])), // Expanded to allow multiline options
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                if (_isAnswered)
                  Text(
                    _isCorrect ? 'Correct!' : 'Incorrect!',
                    style: TextStyle(
                      fontSize: 18,
                      color: _isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                if (_isAnswered)
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    child: Text('Prochaine Question'),
                  ),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final String imagePath;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.imagePath,
  });
}

final List<Question> sampleQuestions = [
  Question(
    questionText: 'Quelle est la capitale du Sénégal ?',
    options: ['Dakar', 'Saint-Louis', 'Thiès', 'Ziguinchor'],
    correctOptionIndex: 0,
    imagePath: 'assets/images/senegal.jpg',
  ),
  Question(
    questionText: 'Quel est le plat national du Sénégal ?',
    options: ['Thiéboudiène', 'Yassa', 'Mafé', 'Domoda'],
    correctOptionIndex: 0,
    imagePath: 'assets/images/mv2.jpg',
  ),
  Question(
    questionText: 'Quelle est la langue officielle du Sénégal ?',
    options: ['Français', 'Wolof', 'Peul', 'Sérère'],
    correctOptionIndex: 0,
    imagePath: 'assets/images/langue.png',
  ),
  Question(
    questionText: 'Quel est le nom de l\'île située au large de Dakar célèbre pour son histoire liée à la traite des esclaves ?',
    options: ['Île de Gorée', 'Île de Ngor', 'Île de Fadiouth', 'Île de Carabane'],
    correctOptionIndex: 0,
    imagePath: 'assets/images/ile.jpg',
  ),
  Question(
    questionText: 'Quelle est la principale religion pratiquée au Sénégal ?',
    options: ['Christianisme', 'Islam', 'Hindouisme', 'Bouddhisme'],
    correctOptionIndex: 1,
    imagePath: 'assets/images/religion.jpg',
  ),
  Question(
    questionText: 'Quel est le nom du président actuel du Sénégal (en 2024) ?',
    options: ['Macky Sall', 'Abdoulaye Wade', 'Léopold Sédar Senghor', 'Abdou Diouf', 'Bassirou Diomaye D Faye'],
    correctOptionIndex: 4,
    imagePath: 'assets/images/president.jpeg',
  ),
  Question(
    questionText: 'Quel est le fleuve qui forme la frontière nord du Sénégal ?',
    options: ['Le fleuve Sénégal', 'Le fleuve Niger', 'Le fleuve Gambie', 'Le fleuve Casamance'],
    correctOptionIndex: 0,
    imagePath: 'assets/images/fleuve.jpg',
  ),
  Question(
    questionText: 'Quelle est la monnaie officielle du Sénégal ?',
    options: ['Franc CFA', 'Naira', 'Cedi', 'Dalasi'],
    correctOptionIndex: 0,
    imagePath: 'assets/images/monnaie.jpg',
  ),
  Question(
    questionText: 'Quel est le nom du célèbre musicien sénégalais connu pour sa musique mbalax ?',
    options: ['Youssou N\'Dour', 'Baaba Maal', 'Ismaël Lô', 'Omar Pène'],
    correctOptionIndex: 0,
    imagePath: 'assets/images/musicien.jpg',
  ),
  Question(
    questionText: 'Quel événement sportif international se déroule à Dakar tous les deux ans ?',
    options: ['Le Dakar', 'La Coupe d\'Afrique des Nations', 'Les Jeux Olympiques de la Jeunesse', 'La Coupe du Monde de la FIFA'],
    correctOptionIndex: 2,
    imagePath: 'assets/images/sportif.jpg',
  ),
];
