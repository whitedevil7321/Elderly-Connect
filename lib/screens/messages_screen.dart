import 'package:flutter/material.dart';

class EmotionAnalyzerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotion Analyzer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;

  Question({
    required this.questionText,
    required this.options,
  });
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int?> userAnswers = List.filled(10, null);

  List<Question> questions = [
    Question(
      questionText: "How do you feel when you wake up in the morning?",
      options: [
        "Energetic (Happy)",
        "Tired (Sad)",
        "Neutral (Neutral)",
        "Anxious (Stressed)",
      ],
    ),
    Question(
      questionText: "What's your favorite way to spend a sunny day?",
      options: [
        "Going for a hike (Joyful)",
        "Staying indoors (Bored)",
        "Reading a book (Content)",
        "Doing chores (Irritated)",
      ],
    ),
    Question(
      questionText: "How do you react to unexpected surprises?",
      options: [
        "Excited (Surprised)",
        "Nervous (Anxious)",
        "Curious (Interested)",
        "Indifferent (Neutral)",
      ],
    ),
    Question(
      questionText:
          "How would you describe your mood when you accomplish a goal?",
      options: [
        "Proud (Happy)",
        "Relieved (Content)",
        "Unaffected (Neutral)",
        "Dissatisfied (Sad)",
      ],
    ),
    Question(
      questionText: "What's your typical response to a challenge?",
      options: [
        "Motivated (Determined)",
        "Overwhelmed (Stressed)",
        "Persistent (Focused)",
        "Apathetic (Indifferent)",
      ],
    ),
    Question(
      questionText: "How do you feel when spending time with loved ones?",
      options: [
        "Happy (Joyful)",
        "Anxious (Nervous)",
        "Content (Content)",
        "Bored (Irritated)",
      ],
    ),
    Question(
      questionText: "How do you react when someone cancels plans with you?",
      options: [
        "Disappointed (Sad)",
        "Relieved (Content)",
        "Unbothered (Neutral)",
        "Irritated (Angry)",
      ],
    ),
    Question(
      questionText:
          "How do you feel when you misplace or can't find something important?",
      options: [
        "Frustrated (Angry)",
        "Amused (Happy)",
        "Calm and patient (Neutral)",
        "Panicked (Anxious)",
      ],
    ),
    Question(
      questionText:
          "How would you respond to receiving unexpected compliments or praise?",
      options: [
        "Grateful and happy (Happy)",
        "Suspicious or doubtful (Doubtful)",
        "Unaffected (Neutral)",
        "Awkward or embarrassed (Embarrassed)",
      ],
    ),
    Question(
      questionText:
          "How do you handle difficult problems or challenges in your daily life?",
      options: [
        "Determined to find a solution (Focused)",
        "Overwhelmed and stressed (Stressed)",
        "Relaxed and composed (Content)",
        "Disinterested (Indifferent)",
      ],
    ),
  ];

  void answerQuestion(int? selectedOption, int questionIndex) {
    setState(() {
      userAnswers[questionIndex] = selectedOption;
    });
  }

  void calculateEmotion() {
    Map<String, double> emotionScores = {
      'Happy': 0,
      'Sad': 0,
      'Neutral': 0,
      'Stressed': 0,
      // Add more emotions and initialize their scores as needed
    };

    for (int i = 0; i < userAnswers.length; i++) {
      int? selectedOption = userAnswers[i];
      if (selectedOption != null) {
        // Assign points based on selected options
        if (i == 0) {
          if (selectedOption == 0) {
            emotionScores['Happy'] = (emotionScores['Happy'] ?? 0) + 1;
          } else if (selectedOption == 1) {
            emotionScores['Sad'] = (emotionScores['Sad'] ?? 0) + 1;
          } else if (selectedOption == 2) {
            emotionScores['Neutral'] = (emotionScores['Neutral'] ?? 0) + 1;
          } else if (selectedOption == 3) {
            emotionScores['Stressed'] = (emotionScores['Stressed'] ?? 0) + 1;
          }
        } else if (i == 1) {
          if (selectedOption == 0) {
            emotionScores['Joyful'] = (emotionScores['Joyful'] ?? 0) + 1;
          } else if (selectedOption == 1) {
            emotionScores['Bored'] = (emotionScores['Bored'] ?? 0) + 1;
          } else if (selectedOption == 2) {
            emotionScores['Content'] = (emotionScores['Content'] ?? 0) + 1;
          } else if (selectedOption == 3) {
            emotionScores['Irritated'] = (emotionScores['Irritated'] ?? 0) + 1;
          }
        }
        // Add more conditions for other questions and options
      }
    }

    String mostProbableEmotion = 'Neutral'; // Default emotion
    double highestScore = 0;

    emotionScores.forEach((emotion, score) {
      if (score > highestScore) {
        mostProbableEmotion = emotion;
        highestScore = score;
      }
    });

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(result: mostProbableEmotion),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emotion Analyzer"),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[index].questionText,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ...questions[index].options.asMap().entries.map(
                    (entry) {
                      int optionIndex = entry.key;
                      String optionText = entry.value;
                      return ListTile(
                        title: Text(optionText),
                        leading: Radio<int?>(
                          value: optionIndex,
                          groupValue: userAnswers[index],
                          onChanged: (value) {
                            answerQuestion(value, index);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calculateEmotion,
        child: Text("Submit"),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String result;

  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: Text(
          "Your most probable emotion is: $result",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
