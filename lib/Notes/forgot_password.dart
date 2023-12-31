import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttre_26/Notes/notes_login_screen.dart';
import 'package:fluttre_26/Notes/notes_screen.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // home: FirebaseAuth.instance.currentUser == null
        home: NotesLoginScreen());
    //  ? QuizLoginScreen()
    //   : const QuizMainScreen(),
    //  );
  }

  Widget navigateToScreen() {
    if (FirebaseAuth.instance.currentUser == null) {
      return NotesLoginScreen();
    } else {
      return NotesScreen();
    }
  }
}