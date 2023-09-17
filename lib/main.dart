import 'package:flutter/material.dart';
import 'package:gpt_app/constants/constants.dart';
import 'package:gpt_app/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: scaffoldbackgroundColor,
          appBarTheme: AppBarTheme(
            color: cardColor,
          )),
      home: const ChatScreen(),
    );
  }
}
