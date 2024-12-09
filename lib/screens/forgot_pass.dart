import 'package:development/service/auth.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  final TextEditingController _emailController = TextEditingController();
  final authService _authService = authService(); // Reuse the instance

  String? emailError;

  // Validate email and update error message
  void _validateEmail() {
    setState(() {
      final email = _emailController.text.trim();
      emailError = null;

      if (email.isEmpty) {
        emailError = 'Please enter an email';
      } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
        emailError = 'Please enter a valid email';
      }
    });
  }

  // Send reset password email
  Future<void> _sendPasswordResetEmail() async {
    _validateEmail(); // Validate email first
    if (emailError != null) {
      return; // Stop if there's a validation error
    }

    try {
      final email = _emailController.text.trim();
      await _authService.forgotPassword(email); // Trigger the forgotPassword function

      // Notify the user of success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset link sent to $email'),
          backgroundColor: Colors.green, // Optional: Add color to differentiate success
        ),
      );

      // Optionally navigate back
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context); // Go back to the previous screen after 2 seconds
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_authService.errormessage ?? 'An unknown error occurred')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img4.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Email Input Field
            Center(
              child: Container(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade900, width: 3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white, width: 3),
                    ),
                    errorText: emailError,
                  ),
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => _validateEmail(),
                ),
              ),
            ),
            // Send Link Button
            Positioned(
              bottom: 170,
              right: 95,
              child: TextButton(
                onPressed: _sendPasswordResetEmail,
                style: TextButton.styleFrom(
                  minimumSize: const Size(200, 40),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Send Link',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'IndieFlower',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Go Back Button
            Positioned(
              bottom: 115,
              right: 95,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                  side: const BorderSide(color: Colors.white, width: 2.0),
                ),
                child: const Text(
                  'Go Back',
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
        ),
      ),
    );
  }
}
