import 'package:flutter/material.dart';


class errorscreen extends StatefulWidget {
  const errorscreen({super.key});

  @override
  State<errorscreen> createState() => _errorscreenState();
}

class _errorscreenState extends State<errorscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('somthing went wrong \n check with userdata!!!'),
            Icon(Icons.error,
            color: Colors.white,
            size: 20.0,
            )
          ],
        ),
      ),
      
    );
  }
}
