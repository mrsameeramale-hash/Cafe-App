import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2D201C),
        title: const Text("Admin Panel"),
      ),

      body: const Center(
        child: Text(
          "Admin Dashboard",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}