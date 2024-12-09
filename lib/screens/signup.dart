import 'package:development/service/auth.dart';
import 'package:development/shared/loading.dart';
import 'package:flutter/material.dart';



class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {


  final TextEditingController _getname = TextEditingController();
  final TextEditingController _getemail = TextEditingController();
  final TextEditingController _getPass = TextEditingController();

  String name = '';
  String pass ='';
  String email = '';

  String? nameError;
  String? passError;
  String? emailError;

  bool _isflag = true;
  bool _loading = false;

  void fetchdata() {
    setState(() {
      name=_getname.text;
      pass = _getPass.text;
      email = _getemail.text;

    });
  }

  void _validateAndSubmit() {
    setState(() {
      nameError = null;
      passError = null;
      emailError = null;
    });

    if ( _getname.text.isEmpty) {
      setState(() {
        nameError = 'Please enter a username';
      });
    }

    if (_getPass.text.isEmpty) {
      setState(() {
        passError = 'Please enter a password';
      });
    } else if (_getPass.text.length < 6) {
      setState(() {
        passError = 'Password must be at least 6 characters';
      });
    }

    if (_getemail.text.isEmpty) {
      setState(() {
        emailError = 'Please enter an email';

      });
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(_getemail.text)) {
      setState(() {
        emailError = 'Please enter a valid email';
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    return _loading ? const Loading() : Scaffold(
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
                ),// image


                Positioned(
                  bottom: 170, // Adjust as needed
                  right: 95,  // Adjust as needed
                  child: TextButton(
                    onPressed: () async {
                        fetchdata();
                        _validateAndSubmit();

                      if(nameError==null && passError==null && emailError== null){
                            print(name);
                            print(email.trim());
                            setState(() {
                              _loading = true;
                              name=name.trim();
                              email = email.trim();
                            });

                        dynamic result = await authService().registerWithEmailandPass(email,name,pass);
                          if(result==null){
                            _loading = false;
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

                    child: const Text('Finish',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'IndieFlower',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),//finish

                Positioned(
                  right: 50,
                    bottom: 425,
                    child: Container(
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _getname,
                        style: const TextStyle(
                        color: Colors.white,
                        ),

                    decoration: InputDecoration(
                          hintText: 'username', // Add hint text
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
                      errorText: nameError,
                    ),
                        textInputAction: TextInputAction.next,
                      ),

                      Container(height: 20,),
                      TextField(
                      controller: _getPass,
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

                        textInputAction: TextInputAction.next,
                      ),



                      Container(height: 20,),
                      TextField(
                        controller: _getemail,
                        style: const TextStyle(
                          color: Colors.white,

                        ),
                        decoration: InputDecoration(
                          hintText: 'Email Id', // Add hint text
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
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                )
                ),//username


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
                ),




              ],



            ) ,
          ) ,
    );
  }
}
