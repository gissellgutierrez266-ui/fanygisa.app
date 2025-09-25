dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../core/app_export.dart';
import '../widgets/custom_error_widget.dart';

// 🧠 Providers para mejoras
import 'providers/achievements_provider.dart';
import 'providers/user_profile_provider.dart';

// 🧩 Pantallas originales y nuevas
import 'screens/welcome_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'screens/achievements_screen.dart';
import 'screens/certificate_screen.dart';
import 'screens/mini_games_screen.dart';
import 'screens/hangman_game.dart';
import 'screens/true_false_game.dart';
import 'screens/drag_drop_game.dart';
import 'screens/exam_screen.dart'; // 🧪 Examen final

// 🧩 Otras pantallas educativas
import 'screens/category_screen.dart';
import 'screens/question_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🚨 CRITICAL: Custom error handling - DO NOT REMOVE
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorWidget(errorDetails: details);
};

  // 🚨 CRITICAL: Device orientation lock - DO NOT REMOVE
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AchievementsProvider()),
            ChangeNotifierProvider(create: (_) => UserProfileProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fanygisa',
            theme: ThemeData(
              primaryColor: const Color(0xFF00FFFF), // 💙 Azul eléctrico
              scaffoldBackgroundColor: Colors.black,
              fontFamily: 'Roboto',
              textTheme: ThemeData.dark().textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00FFFF),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
),
),
),
            home: const WelcomeScreen(),
            routes: {
              '/profile': (_) => const ProfileScreen(),
              '/settings': (_) => const SettingsScreen(),
              '/quiz': (_) => const QuizScreen(),
              '/results': (_) => const ResultScreen(),
              '/achievements': (_) => const AchievementsScreen(),
              '/certificate': (_) => const CertificateScreen(),
              '/minigames': (_) => const MiniGamesScreen(),
              '/hangman': (_) => const HangmanGame(),
              '/truefalse': (_) => const TrueFalseGame(),
              '/dragdrop': (_) => const DragDropGame(),
              '/exam': (_) => const ExamScreen(), // 🧪 Examen final

              // 🔁 Pantallas educativas
              '/category': (_) => const CategoryScreen(),
              '/question': (_) => const QuestionScreen(),
              '/loading': (_) => const LoadingScreen(),
              '/error': (_) => const ErrorScreen(),
},
),
);
}, 
);
}
}
