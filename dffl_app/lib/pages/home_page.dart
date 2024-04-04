import 'package:dffl_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.background,
         title: Text("homepage"),
         centerTitle: false,
         actions: [
          Icon(Icons.location_on_outlined),

         ],
       ),
       body: ListView(children: mockUsersFromServers(),)
    );
  }
}

Widget _userItem(){
   return  Row(
          children: [
               Image.asset('assets/temp/user1.png',
               width: 40,
               height: 40,
               ),
               SizedBox(width: 16,),
               const Text('blair tonny'),
             ],
           );
}

List<Widget> mockUsersFromServers(){
  List<Widget> users = [];
  for (var i = 0; i < 1000; i++) {
    users.add(_userItem());
  }
  return users;
}