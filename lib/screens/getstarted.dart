import 'dart:io';

import 'package:development/screens/login.dart';
import 'package:development/screens/signup.dart';
import 'package:flutter/material.dart';

class getstarted extends StatefulWidget {
  const getstarted({super.key});

  @override
  State<getstarted> createState() => _getstarted();
}

class _getstarted extends State<getstarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Center(
        child: Stack(
          children: [


            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/img4.jpeg'),
                      fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              bottom: 75, // Adjust as needed
              right: 35,  // Adjust as needed
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const login()));

                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2.0,),
                  backgroundColor: Colors.white,
                ),


                child: const Text('login now',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),

                ),
              ),
            ),


            Positioned(
              bottom: 75, // Adjust as needed
              right: 225,  // Adjust as needed
              child: OutlinedButton(
                onPressed: () {
                  exit(0);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  side: const BorderSide(
                  color: Colors.white,
                  width: 2.0,),
                ),


                child: const Text('Close',
                  style: TextStyle(
                    fontSize: 20.0,
                      fontFamily: 'IndieFlower',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),

                ),
              ),
            ),

            Positioned(
              bottom: 500,
              left: 0,
              right: 150,
              child: Container(
                color: Colors.black.withOpacity(0.0), // Adjust opacity as needed

                child: const Text(
                  'Let\'s get \n\t started,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'IndieFlower',


                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 190,
              child: Container(
                color: Colors.black.withOpacity(0.0), // Adjust opacity as needed

                child: const Text(
                  'new user signup,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'IndieFlower',


                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Positioned(
              bottom: 16, // Adjust as needed
              right: 80,  // Adjust as needed
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const signup()));
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(150, 50),
                ),


                child: const Text('click here',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'IndieFlower',
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}




