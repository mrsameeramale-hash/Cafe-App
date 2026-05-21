import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    checkLogin();
  }

  // Check User Login
  void checkLogin() {

    Timer(
      const Duration(seconds: 2),

          () {

        // Current Firebase User
        User? user = FirebaseAuth.instance.currentUser;

        // If User Logged In
        if (user != null) {

          Navigator.pushReplacement(

            context,

            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );

        } else {

          // If User Not Logged In
          Navigator.pushReplacement(

            context,

            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xff0C0F14),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: const [

            Icon(
              Icons.local_cafe,
              size: 90,
              color: Color(0xffD17842),
            ),

            SizedBox(height: 20),

            Text(
              "Coffee App",

              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            CircularProgressIndicator(
              color: Color(0xffD17842),
            ),
          ],
        ),
      ),
    );
  }
}