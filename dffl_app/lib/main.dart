import 'package:dffl_app/pages/home_page.dart';
import 'package:dffl_app/pages/login.dart';
import 'package:dffl_app/pages/main_page.dart';
import 'package:dffl_app/pages/test_page.dart';
import 'package:dffl_app/wkt/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Welcome(),
      //home: MainPage(),
      /*initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const HomePage(),
         '/main': (context) => const MainPage(),
      },*/
    );
  }
}

