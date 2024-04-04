import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nyimbo_za_kristo/title.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> titles = [];
  bool isLoading = false;

  Future<void> fetchTitles() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/titles'));
      if (response.statusCode == 200) {
        setState(() {
          titles = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load titles');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to fetch titles. Please try again later."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTitles();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title List'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(titles[index]['title']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TitleDetail(title: titles[index]['title'], description: titles[index]['description']),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}