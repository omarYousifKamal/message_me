import 'package:flutter/material.dart';
import 'package:messagegame_app/screens/chat_screen.dart';
import 'package:messagegame_app/screens/registration_screen.dart';
import 'package:messagegame_app/screens/signin_screen.dart';
import 'package:messagegame_app/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MessageMe app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const ChatScreen(),
        //لێره له جیاتی هۆم ئه‌و روتانه‌ به‌كارده‌هێنی
        initialRoute: WelcomeScreen.screenRoute,
        routes: {
          WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
          SigInScreen.screenRoute: (context) => const SigInScreen(),
          RigistrationScreen.screenRoute: (context) =>
              const RigistrationScreen(),
          ChatScreen.screenRoute: (context) => const ChatScreen()
        });
  }
}
