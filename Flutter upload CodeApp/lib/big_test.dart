import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const Quiz()); // Startpunkt der App
}

// -------------------------------------------------------------------------QUIZ
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String? currentUser;

  @override
  void initState() {
    super.initState();
    _loadUser(); // Beim Start: Benutzer laden
  }

  // Benutzer abmelden
  void handleLogout() async {
    await UserManager.logout();
    setState(() {
      activeScreen = 'login-screen';
      selectedAnswers = [];
    });
  }

  // Benutzer laden und Screen entsprechend wählen
  Future<void> _loadUser() async {
    final user = await UserManager.getCurrentUser();
    setState(() {
      currentUser = user;
      activeScreen = user == null ? 'login-screen' : 'start-screen';
    });
  }

  List<String> selectedAnswers = [];
  List<QuizQuestion> selectedQuestions = dartQuestions; // Standard: Dart
  var activeScreen = 'start-screen';
  String quizTopic = 'dart'; // Standardthema

  // Quiz starten mit gewähltem Thema
  void startQuizWith(String quizType) {
    setState(() {
      quizTopic = quizType;

      // Fragen je nach Thema setzen
      if (quizType == 'dart') {
        selectedQuestions = dartQuestions;
      } else if (quizType == 'python') {
        selectedQuestions = pythonQuestions;
      } else if (quizType == 'java') {
        selectedQuestions = javaQuestions;
      }

      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  // Antwort speichern und bei letzter Frage Ergebnisse zeigen
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == selectedQuestions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  // Quiz neu starten
  void restartQuiz() {
    setState(() {
      selectedAnswers =
          []; // Antworten zurücksetzen, sonst werden sie im neuen Quiz angezeigt
      activeScreen = 'question-screen';
    });
  }

  // Vorzeitig beenden
  void quitQuizEarly() {
    setState(() {
      activeScreen = 'results-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = const SizedBox(); // Platzhalter-Widget

    // Bildschirmlogik
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(
        onStartQuiz: startQuizWith,
        onLogout: handleLogout,
      );
    }

    if (activeScreen == 'login-screen') {
      screenWidget = LoginScreen(
        onLogin: (username) {
          setState(() {
            currentUser = username;
            activeScreen = 'start-screen';
          });
        },
      );
    }

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
        onQuitQuiz: quitQuizEarly,
        questions: selectedQuestions,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        questions: selectedQuestions,
        onRestart: restartQuiz,
        onGoToStart: () {
          setState(() {
            activeScreen = 'start-screen';
            selectedAnswers = [];
          });
        },
        quizTopic: quizTopic,
      );
    }

    // Hauptstruktur der App und der FArbenverlauf im Hintergrund
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 58, 183, 79),
                Color.fromARGB(255, 0, 128, 128),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------START SCREEN
class StartScreen extends StatelessWidget {
  const StartScreen({
    required this.onStartQuiz,
    required this.onLogout,
    super.key,
  });

  final void Function(String quizType) onStartQuiz;
  final void Function() onLogout;

  @override
  Widget build(context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dart-Quiz starten
            Image.asset('assets/flutter.png', height: 100),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => onStartQuiz('dart'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              icon: const Icon(Icons.flutter_dash),
              label: const Text('Flutter Quiz'),
            ),

            const SizedBox(height: 24),

            // Python-Quiz starten
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/python.png', height: 100),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => onStartQuiz('python'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              icon: const Icon(Icons.code),
              label: const Text('Python Quiz'),
            ),

            const SizedBox(height: 24),

            // Java-Quiz starten
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/java.png', height: 100),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => onStartQuiz('java'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              icon: const Icon(Icons.coffee),
              label: const Text('Java Quiz'),
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UserManagementScreen(),
                  ),
                );
              },
              child: const Text("User verwalten"),
            ),
            ElevatedButton.icon(
              onPressed: onLogout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------------------QUESTION SCREEN
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
    required this.onQuitQuiz,
    required this.questions,
  });

  final void Function(String answer) onSelectAnswer;
  final void Function() onQuitQuiz;
  final List<QuizQuestion> questions;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  // Antwort wählen und zur nächsten Frage springen
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = widget.questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Frage anzeigen
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Color.fromARGB(255, 247, 246, 246),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Antworten anzeigen
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            // Quiz beenden Button
            ElevatedButton(
              onPressed: widget.onQuitQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Quiz beenden'),
            ),
          ],
        ),
      ),
    );
  }
}

// Antwort-Button
class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 254, 254, 254),
        foregroundColor: const Color.fromARGB(255, 5, 5, 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}

// ---------------------------------------------------------------RESULTS SCREEN

// Zusammenfassung der Fragen
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) => SummaryItem(itemData: data)).toList(),
        ),
      ),
    );
  }
}

//-------------------------------------------------------- Ergebnisse-Bildschirm
class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
    required this.onGoToStart,
    required this.questions,
    required this.quizTopic,
  });

  final void Function() onRestart;
  final void Function() onGoToStart;
  final List<String> chosenAnswers;
  final List<QuizQuestion> questions;
  final String quizTopic;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  int? bestScore;

  @override
  void initState() {
    super.initState();
    _loadBestScore();
    _saveCurrentScoreIfBetter();
  }

  // Besten Score laden
  Future<void> _loadBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    final user = await UserManager.getCurrentUser();
    if (user == null) return;

    final topicKey = 'bestScore_${user}_${widget.quizTopic}';
    setState(() {
      bestScore = prefs.getInt(topicKey) ?? 0;
    });
  }

  // Aktuellen Score speichern, wenn besser
  Future<void> _saveCurrentScoreIfBetter() async {
    final prefs = await SharedPreferences.getInstance();
    final user = await UserManager.getCurrentUser();
    if (user == null) return;

    final topic = widget.quizTopic;
    final currentScore = _calculateCorrectAnswers();

    final bestKey = 'bestScore_${user}_$topic';
    final recentKey = 'recentScores_${user}_$topic';

    int savedBestScore = prefs.getInt(bestKey) ?? 0;
    if (currentScore > savedBestScore) {
      await prefs.setInt(bestKey, currentScore);
      setState(() {
        bestScore = currentScore;
      });
    }

    List<int> recentScores = [];
    final jsonString = prefs.getString(recentKey);
    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      recentScores = decoded.cast<int>();
    }

    recentScores.insert(0, currentScore);
    if (recentScores.length > 3) {
      recentScores = recentScores.sublist(0, 3);
    }

    await prefs.setString(recentKey, jsonEncode(recentScores));
  }

  // Letzte drei Scores laden
  Future<List<int>> _loadRecentScores() async {
    final prefs = await SharedPreferences.getInstance();
    final user = await UserManager.getCurrentUser();
    if (user == null) return [];

    final topicKey = 'recentScores_${user}_${widget.quizTopic}';
    final jsonString = prefs.getString(topicKey);
    if (jsonString == null) return [];

    final List decoded = jsonDecode(jsonString);
    return decoded.cast<int>();
  }

  // Richtige Antworten zählen
  int _calculateCorrectAnswers() {
    int correct = 0;
    for (int i = 0; i < widget.chosenAnswers.length; i++) {
      if (widget.chosenAnswers[i] == widget.questions[i].answers[0]) {
        correct++;
      }
    }
    return correct;
  }

  // Zusammenfassungsdaten vorbereiten
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': widget.questions[i].text,
        'correct_answer': widget.questions[i].answers[0],
        'user_answer': widget.chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = widget.chosenAnswers.length;
    final numCorrectQuestions = _calculateCorrectAnswers();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "Du hast $numCorrectQuestions von $numTotalQuestions Fragen richtig beantwortet!",
              style: const TextStyle(
                color: Color.fromARGB(255, 247, 246, 246),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            if (bestScore != null)
              Text(
                "Dein bestes Ergebnis ist: $bestScore",
                style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 10),

            // Letzte 3 Versuche
            FutureBuilder<List<int>>(
              future: _loadRecentScores(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox.shrink();
                }
                final scores = snapshot.data!;
                return Column(
                  children: [
                    const Text(
                      "Letzten 3 Versuche:",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    for (var i = 0; i < scores.length; i++)
                      Text(
                        "Versuch ${i + 1}: ${scores[i]} / $numTotalQuestions",
                        style: const TextStyle(color: Colors.white70),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),

            // Buttons: Neustart / Startscreen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: widget.onRestart,
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  icon: const Icon(Icons.refresh),
                  label: const Text("Quiz neu starten"),
                ),
                const SizedBox(width: 16),
                TextButton.icon(
                  onPressed: widget.onGoToStart,
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  icon: const Icon(Icons.home),
                  label: const Text("Startscreen"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------- SummaryItem Widget ----------------------------
class SummaryItem extends StatelessWidget {
  const SummaryItem({this.itemData, super.key});

  final Map<String, Object>? itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData!['user_answer'] == itemData!['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Frage-Index + Korrektheitsanzeige
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData!['question_index'] as int,
          ),
          const SizedBox(width: 20),
          // Frage + Antworten
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData!['question'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Deine Antwort: ${itemData!['user_answer']}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 185, 185),
                  ),
                ),
                Text(
                  "Richtige Antwort: ${itemData!['correct_answer']}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 144, 238, 144),
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

// ------------------------- QuestionIdentifier Widget ------------------------
class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    required this.isCorrectAnswer,
    required this.questionIndex,
    super.key,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:
            isCorrectAnswer
                ? const Color.fromARGB(255, 1, 250, 76) // grün bei korrekt
                : Colors.red, // rot bei falsch
        borderRadius: BorderRadius.circular(100),
      ),
      margin: const EdgeInsets.only(right: 10),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

// -------------------------------  UserManager -------------------------------
class UserManager {
  static const _keyCurrentUser = 'current_user';
  static const _keyUserList = 'user_list';

  // Einloggen + hinzufügen falls neu
  static Future<void> login(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCurrentUser, username);
    await _addUserIfNotExists(username);
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCurrentUser);
  }

  static Future<String?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyCurrentUser);
  }

  // ------------------------- Userliste verwalten ----------------------------
  static Future<void> _addUserIfNotExists(String username) async {
    final users = await getAllUsers();
    final exists = users.any((user) => user.username == username);
    if (!exists) {
      users.add(AppUser(username: username));
      await _saveAllUsers(users);
    }
  }

  static Future<List<AppUser>> getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyUserList);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => AppUser.fromJson(e)).toList();
  }

  static Future<void> _saveAllUsers(List<AppUser> users) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(users.map((u) => u.toJson()).toList());
    await prefs.setString(_keyUserList, encoded);
  }

  static Future<void> deleteUser(String username) async {
    final users = await getAllUsers();
    users.removeWhere((u) => u.username == username);
    await _saveAllUsers(users);

    final prefs = await SharedPreferences.getInstance();

    // Benutzer-spezifische Scores entfernen
    const topics = ['python', 'java', 'dart'];
    for (final topic in topics) {
      final key = 'bestScore_${username}_$topic';
      await prefs.remove(key);
    }

    // Falls aktueller User -> entfernen
    if (prefs.getString(_keyCurrentUser) == username) {
      await prefs.remove(_keyCurrentUser);
    }
  }

  static Future<void> updateUser(String oldUsername, String newUsername) async {
    final users = await getAllUsers();
    final index = users.indexWhere((u) => u.username == oldUsername);
    if (index != -1) {
      users[index] = AppUser(username: newUsername);
      await _saveAllUsers(users);

      final prefs = await SharedPreferences.getInstance();
      final currentUser = prefs.getString(_keyCurrentUser);
      if (currentUser == oldUsername) {
        await prefs.setString(_keyCurrentUser, newUsername);
      }
    }
  }

  // Scores laden
  static Future<Map<String, Map<String, int>>> getUserScores(
    String username,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    const topics = ['python', 'java', 'dart'];

    final scores = <String, Map<String, int>>{};

    for (final topic in topics) {
      final key = 'bestScore_${username}_$topic';
      final score = prefs.getInt(key) ?? 0;

      int maxQuestions = 0;
      switch (topic) {
        case 'python':
          maxQuestions = pythonQuestions.length;
          break;
        case 'java':
          maxQuestions = javaQuestions.length;
          break;
        case 'dart':
          maxQuestions = dartQuestions.length;
          break;
      }

      scores[topic] = {'score': score, 'max': maxQuestions};
    }

    return scores;
  }
}

// --------------------------- AppUser-Datenmodell ---------------------------
class AppUser {
  final String username;

  AppUser({required this.username});

  Map<String, dynamic> toJson() => {'username': username};

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      AppUser(username: json['username']);
}

// ---------------------- UserManagementScreen (UI) -------------------------
class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  List<AppUser> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final allUsers = await UserManager.getAllUsers();
    setState(() => users = allUsers);
  }

  Future<void> _deleteUser(String username) async {
    await UserManager.deleteUser(username);
    _loadUsers();
  }

  Future<void> _editUser(AppUser user) async {
    final controller = TextEditingController(text: user.username);
    final result = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("User bearbeiten"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Neuer Username"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Abbrechen"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, controller.text.trim()),
                child: const Text("Speichern"),
              ),
            ],
          ),
    );

    if (result != null && result.isNotEmpty) {
      await UserManager.updateUser(user.username, result);
      _loadUsers();
    }
  }

  Future<void> _addUser() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Neuer User"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Abbrechen"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, controller.text.trim()),
                child: const Text("Hinzufügen"),
              ),
            ],
          ),
    );

    if (result != null && result.isNotEmpty) {
      await UserManager.login(result); // User speichern
      _loadUsers();
    }
  }

  Future<void> _viewUserScores(String username) async {
    final scores = await UserManager.getUserScores(username);

    if (!mounted) return;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("$username's Quiz Scores"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  scores.entries.map((entry) {
                    final topic = entry.key;
                    final score = entry.value['score']!;
                    final max = entry.value['max']!;
                    return ListTile(
                      title: Text(topic),
                      trailing: Text(
                        '$score / $max',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Schließen"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Bearbeiten"),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: _addUser)],
      ),
      body:
          users.isEmpty
              ? const Center(child: Text("Keine User gefunden."))
              : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user.username),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editUser(user),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteUser(user.username),
                        ),
                        IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () => _viewUserScores(user.username),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}

// ------------------------------- LoginScreen ---------------------------------
class LoginScreen extends StatefulWidget {
  final void Function(String username) onLogin;

  const LoginScreen({super.key, required this.onLogin});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();

  void _handleLogin() {
    final username = _controller.text.trim();
    if (username.isNotEmpty) {
      UserManager.login(username).then((_) {
        widget.onLogin(username);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Gib deinen Benutzernamen ein:',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Login / Account erstellen'),
            ),
          ],
        ),
      ),
    );
  }
}
