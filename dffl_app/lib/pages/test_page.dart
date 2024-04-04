import 'package:flutter/material.dart';

class TestPsage extends StatefulWidget {
  const TestPsage({super.key});

  @override
  State<TestPsage> createState() => _TestPsageState();
}

class _TestPsageState extends State<TestPsage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('test'),
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Text(
            'This is counter: $count',
            style: TextStyle(
              fontSize: 30, color: Colors.white
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
        ),
    );
  }
}