import 'package:firebase_core/firebase_core.dart';
import 'package:newchatpro/screens/chat_screen.dart';
import './screens/login_screen.dart';
import './screens/registration_screen.dart';
import './screens/welcome_screen.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(FlashChat());
}


class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {WelcomeScreen.id:(context)=> WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        ChatScreen.id:(context)=>ChatScreen()},
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge : TextStyle(color: Colors.black54),
        ),
      ),
      // home: WelcomeScreen(),
    );
  }
}
