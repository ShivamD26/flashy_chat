import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flashy_chat/screens/welcome_screen.dart';
import 'package:flashy_chat/screens/login_screen.dart';
import 'package:flashy_chat/screens/registration_screen.dart';
import 'package:flashy_chat/screens/chat_screen.dart';

import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(FlashChat());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyAsBGF2cUrk2wFvRCykRc0qlZwZO2B4lKw',
        appId: '1:672021206639:android:ab6df7d23460c87eb75f9a',
        messagingSenderId:
        '672021206639',
        projectId: 'flashy-chat-d6306'),

  ):await Firebase.initializeApp();
  runApp(FlashChat());
}


class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context)=> WelcomeScreen(),
        RegistrationScreen.id: (context)=>RegistrationScreen(),
        LoginScreen.id: (context)=>LoginScreen(),
       ChatScreen.id: (context)=>ChatScreen(),
      },
    );
  }
}
