
import 'package:development/models/user.dart';
import 'package:development/screens/error%20screen.dart';
import 'package:development/service/auth.dart';
import 'package:development/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:development/service/DBS.dart';
import 'package:provider/provider.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {



    final authService _auth = authService();



    // Retrieve the current user
    final MyUser? user = Provider.of<MyUser?>(context);

    if (user == null || user.uid == null) {
      return const errorscreen();
    }

    return StreamBuilder<Userdata>(
      stream: DatabaseService(uid: user.uid!).userdata,
      builder: (context, snapshot) {
        final Userdata? RD = snapshot.data;


        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Loading(); // Show a loading indicator
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const errorscreen(); // Show error screen if something goes wrong
        }

        // Data is available
        // recived data




        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                label: const Text(
                  'logout',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'mulishV',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () async {
                  await _auth.signout();
                },
              )
            ],
          ),
          body: Center(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img5.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 500,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
                    child: Text(
                      'Welcome\n\t\t\t\t  ${RD?.username}',
                      style: const TextStyle(
                        height: 0.9,
                        fontSize: 60,
                        fontFamily: 'DancingScript',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
