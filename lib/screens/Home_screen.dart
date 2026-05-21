import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu_screen.dart';
import 'favorite_screen.dart';
import 'about_screen.dart';
import 'table_booking_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

import 'package:hotel_app/ providers/cart_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff0C0F14),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                /// TOP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Hi Sameer 👋",
                          style: TextStyle(color: Colors.grey),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Sammyy's Cafe ☕",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [

                        /// CART BADGE
                        Stack(
                          children: [

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const CartScreen(),
                                  ),
                                );
                              },

                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xff141921),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            if (cartProvider.totalItems > 0)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    cartProvider.totalItems.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(width: 12),

                        /// PROFILE BUTTON
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ProfileScreen(),
                              ),
                            );
                          },

                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffD17842),
                                  Color(0xffC67C4E),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// BANNER
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Explore",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,

                  children: [

                    buildCard(context, "Menu", Icons.restaurant_menu,
                        const Color(0xffD17842), () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const MenuScreen()));
                        }),

                    buildCard(context, "Favorites", Icons.favorite,
                        Colors.red, () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const FavoriteScreen()));
                        }),

                    buildCard(context, "Book Table", Icons.table_restaurant,
                        Colors.green, () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const TableBookingScreen()));
                        }),

                    buildCard(context, "About", Icons.info,
                        Colors.blue, () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const AboutScreen()));
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, IconData icon,
      Color color, VoidCallback onTap) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            colors: [
              Color(0xff252A32),
              Color(0xff141921),
            ],
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),

            const SizedBox(height: 10),

            Text(title,
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}