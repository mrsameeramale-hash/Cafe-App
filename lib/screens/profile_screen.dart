import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hotel_app/ providers/cart_provider.dart';
import 'login_screen.dart';
import 'order_history_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<CartProvider>(context);
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xff0C0F14),

      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xffD17842),

              child: Text(
                user?.displayName != null
                    ? user!.displayName![0].toUpperCase()
                    : "U",
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              user?.displayName ?? "No Name",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              user?.email ?? "",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // 🔥 ORDER HISTORY BUTTON
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OrderHistoryScreen(),
                  ),
                );
              },

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              tileColor: const Color(0xff141921),

              leading: const Icon(Icons.history, color: Color(0xffD17842)),

              title: const Text(
                "Order History",
                style: TextStyle(color: Colors.white),
              ),

              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // STATS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat("Favorites", provider.favoriteItems.length.toString()),
                _stat("Cart", provider.totalItems.toString()),
              ],
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () => logout(context),

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffD17842),
                minimumSize: const Size(double.infinity, 55),
              ),

              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xffD17842),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}