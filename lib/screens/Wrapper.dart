import 'package:development/home/home.dart';
import 'package:development/models/user.dart';
import 'package:development/screens/getstarted.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
   const Wrapper({super.key});

   @override
   Widget build(BuildContext context) {
     final MyUser? user = Provider.of<MyUser?>(context);
     print('current user $user');

     if (user == null) {
       return const getstarted(); // Show the getstarted screen if no user is logged in
     } else {
       // Replace with your authenticated screen
       return const home();
     }

  }
}
