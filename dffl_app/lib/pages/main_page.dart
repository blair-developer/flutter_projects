import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.background,
        title: Text('Bottom navigation'),
      ),
      body: Center(child: Text('text'),),
      bottomNavigationBar: BottomNavigationBar(items: 
        [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Services'),
           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Post'),
        ],
        onTap: (index){
           setState(() {
             currentIndex = index;
           });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.amber,
      ),
    );
  }
} 