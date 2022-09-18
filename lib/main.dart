import 'package:flutter/material.dart';
import 'package:schoolapp/View/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa ZSEIO',
      theme: ThemeData(
        primaryColor: Colors.amber,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.yellow.shade600),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      home: const MyHome(),
    );
  }
}
