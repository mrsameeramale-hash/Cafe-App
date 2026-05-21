// lib/screens/cart_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hotel_app/ providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff0C0F14),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Cart ☕",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: provider.cartItems.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Your Cart Is Empty ☕",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )

          : Column(
        children: [

          /// CART ITEMS
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: provider.cartItems.length,
              itemBuilder: (context, index) {

                final item = provider.cartItems[index];
                final food = item['food'];
                final quantity = item['quantity'];

                /// ✅ CALCULATE TOTAL PER ITEM
                final itemTotal = food.price * quantity;

                return Container(
                  margin: const EdgeInsets.only(bottom: 18),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff252A32),
                        Color(0xff141921),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 20,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(15),

                    child: Row(
                      children: [

                        /// IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            food.image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 15),

                        /// DETAILS
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                food.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                food.description,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// ✅ PRICE UI (MULTIPLY + TOTAL)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹${food.price} x $quantity",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "₹$itemTotal",
                                    style: const TextStyle(
                                      color: Color(0xffD17842),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),

                              /// QUANTITY BUTTONS
                              Row(
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      provider.decreaseQuantity(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD17842),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    child: Text(
                                      quantity.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      provider.increaseQuantity(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD17842),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /// DELETE BUTTON
                        IconButton(
                          onPressed: () {
                            provider.removeFromCart(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// TOTAL SECTION
          Container(
            padding: const EdgeInsets.all(25),

            decoration: const BoxDecoration(
              color: Color(0xff141921),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35),
              ),
            ),

            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "₹${provider.totalPrice.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Color(0xffD17842),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                /// PLACE ORDER BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 60,

                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xff252A32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),

                            title: const Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 35,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Order Success",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),

                            content: const Text(
                              "Your coffee order has been placed successfully ☕",
                              style: TextStyle(color: Colors.white70),
                            ),

                            actions: [
                              TextButton(
                                onPressed: () {
                                  provider.clearCart();
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Color(0xffD17842),
                                      content: Text(
                                        "Order Placed Successfully ☕",
                                      ),
                                    ),
                                  );
                                },

                                child: const Text(
                                  "OK",
                                  style: TextStyle(
                                    color: Color(0xffD17842),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD17842),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}