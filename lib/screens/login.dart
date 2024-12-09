import 'package:development/screens/forgot_pass.dart';
import 'package:development/shared/loading.dart';
import 'package:flutter/material.dart';

import '../service/auth.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final authService _auth = authService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isflag = true;
  bool _loading = false;


  String emailid = '';
  String password = '';

  String? nameError;
  String? passError;
  String? emailError;






  void collectdata() {
    setState(() {
     password = _password.text;
      emailid = _email.text;

    });
  }

  void _validateAndSubmit() {
    setState(() {
      nameError = null;
      passError = null;
      emailError = null;
    });

    if (_password.text.isEmpty) {
      setState(() {
        passError = 'Please enter a password';
      });
    } else if (_password.text.length < 6) {
      setState(() {
        passError = 'Password must be at least 6 characters';
      });
    }

    if (_email.text.isEmpty) {
      setState(() {
        emailError = 'Please enter an email';

      });
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(_email.text)) {
      setState(() {
        emailError = 'Please enter a valid email';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return  _loading ? const Loading() : Scaffold(
        resizeToAvoidBottomInset: false,
      body: Center(
        child:
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/img4.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),//background image

            Positioned(
              bottom: 170, // Adjust as needed
              right: 95,  // Adjust as needed
              child: TextButton(
                onPressed: () async {
                  collectdata();
                  _validateAndSubmit();
                  if(nameError==null && passError==null && emailError== null){

                    print(emailid.trim());
                    setState(() {
                      _loading = true;
                      emailid = emailid.trim();
                    });
                    dynamic result = await authService().login(emailid, password);
                    if(result==null){

                      setState(() {
                        _loading = false;
                      });
                      String? _er = authService().errormessage;
                      if (_er != null && _er.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(_er)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('An unknown error occurred')),
                        );
                      }

                    }
                    else{
                      Navigator.pop(context);
                    }

                  }

                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(200, 40),

                  backgroundColor: Colors.white,
                ),
                  child: const Text('login',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),

                ),
              ),
            ),//login

            Positioned(
                right: 50,
                bottom: 425,
                child: Container(
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _email,
                        style: const TextStyle(
                          color: Colors.white,

                        ),
                        decoration: InputDecoration(
                          hintText: 'email', // Add hint text
                          hintStyle: TextStyle(color: Colors.grey.shade500),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade900,
                              width: 3,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          errorText: emailError,
                        ),
                        textInputAction: TextInputAction.next,
                      ),//email

                      Container(height: 20,),
                      TextField(
                        controller:_password,
                        style: const TextStyle(
                          color: Colors.white,


                        ),
                        obscureText:_isflag,
                        decoration: InputDecoration(
                          suffixIcon: IconButton( onPressed: (){
                            setState(() {
                              _isflag = !_isflag;
                            });


                          } ,icon:_isflag? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                              ),

                          hintText: 'password', // Add hint text
                          hintStyle: TextStyle(color: Colors.grey.shade500),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade900,
                              width: 3,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          errorText: passError,
                        ),

                        textInputAction: TextInputAction.done,
                      ),//password

                    ],
                  ),
                )
            ),

            Positioned(
              bottom: 115, // Adjust as needed
              right: 95,  // Adjust as needed
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2.0,),
                ),


                child: const Text('Go Back',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),

                ),
              ),
            ),//go back

            Positioned(
                right: 180,
              bottom: 385,
              child : Container(
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassPage()));
                }, child: const Text('Forgotten password ?',
                style : TextStyle(
                  color: Colors.blueAccent
                ) ,
                )
                ),
              ),
            )




          ],



      ) ,
      ),
    );
  }
}
