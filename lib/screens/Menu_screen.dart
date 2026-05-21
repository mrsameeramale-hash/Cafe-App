import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/food_data.dart';
import 'package:hotel_app/ providers/cart_provider.dart';
import 'cart_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String search = "";

  final List<String> categories = [
    "All",
    "Coffee",
    "Burger",
    "Pizza",
    "Dessert",
    "Pasta",
  ];

  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    final filteredFoods = foodList.where((food) {
      final matchSearch =
      food.name.toLowerCase().contains(search.toLowerCase());

      final matchCategory =
          selectedCategory == "All" ||
              food.category == selectedCategory;

      return matchSearch && matchCategory;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xff0C0F14),

      body: SafeArea(
        child: Column(
          children: [

            // 🔝 TOP SECTION
            Padding(
              padding: const EdgeInsets.all(20),

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  const Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        "Find Your",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Favorite Good Stuff ☕",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // 🛒 CART
                  Consumer<CartProvider>(
                    builder: (context, provider, child) {
                      return Stack(
                        children: [

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                  const CartScreen(),
                                ),
                              );
                            },

                            child: Container(
                              padding:
                              const EdgeInsets.all(14),

                              decoration: BoxDecoration(
                                color:
                                const Color(0xff141921),

                                borderRadius:
                                BorderRadius.circular(
                                    18),
                              ),

                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          if (provider
                              .cartItems.isNotEmpty)
                            Positioned(
                              right: 0,
                              top: 0,

                              child: Container(
                                padding:
                                const EdgeInsets.all(6),

                                decoration:
                                const BoxDecoration(
                                  color:
                                  Color(0xffD17842),
                                  shape: BoxShape.circle,
                                ),

                                child: Text(
                                  provider.cartItems.length
                                      .toString(),

                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // 🔍 SEARCH BAR
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),

              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15),

                decoration: BoxDecoration(
                  color: const Color(0xff141921),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: TextField(
                  style:
                  const TextStyle(color: Colors.white),

                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                  },

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Food...",
                    hintStyle:
                    TextStyle(color: Colors.grey),

                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🍔 CATEGORY
            SizedBox(
              height: 50,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,

                itemBuilder: (context, index) {
                  final category = categories[index];

                  final isSelected =
                      selectedCategory == category;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },

                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(
                          horizontal: 8),

                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 22,
                      ),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xffD17842)
                            : const Color(0xff141921),

                        borderRadius:
                        BorderRadius.circular(18),
                      ),

                      child: Center(
                        child: Text(
                          category,

                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.grey,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // 🔥 FOOD GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),

                itemCount: filteredFoods.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,

                  // 🔥 FIXED OVERFLOW
                  childAspectRatio: 0.58,
                ),

                itemBuilder: (context, index) {
                  final food = filteredFoods[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff141921),

                      borderRadius:
                      BorderRadius.circular(22),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        // 🍕 IMAGE
                        ClipRRect(
                          borderRadius:
                          const BorderRadius.vertical(
                            top: Radius.circular(22),
                          ),

                          child: SizedBox(
                            height: 130,
                            width: double.infinity,

                            child: Image.network(
                              food.image,
                              fit: BoxFit.cover,

                              loadingBuilder: (
                                  context,
                                  child,
                                  loadingProgress,
                                  ) {
                                if (loadingProgress ==
                                    null) {
                                  return child;
                                }

                                return const Center(
                                  child:
                                  CircularProgressIndicator(
                                    color: Color(
                                        0xffD17842),
                                  ),
                                );
                              },

                              errorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                  ) {
                                return Container(
                                  color: Colors.black12,

                                  child: const Center(
                                    child: Icon(
                                      Icons
                                          .broken_image,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        // 🔥 CONTENT
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.all(10),

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                // 🍔 NAME
                                Text(
                                  food.name,

                                  maxLines: 1,

                                  overflow:
                                  TextOverflow
                                      .ellipsis,

                                  style:
                                  const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                // 📝 DESCRIPTION
                                Text(
                                  food.description,

                                  maxLines: 2,

                                  overflow:
                                  TextOverflow
                                      .ellipsis,

                                  style:
                                  const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // ⭐ RATING
                                const Row(
                                  children: [

                                    Icon(
                                      Icons.star,
                                      color:
                                      Colors.orange,
                                      size: 14,
                                    ),

                                    SizedBox(width: 4),

                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                        color:
                                        Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),

                                const Spacer(),

                                // 💰 PRICE + BUTTON
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,

                                  children: [

                                    Flexible(
                                      child: Text(
                                        "₹${food.price}",

                                        overflow:
                                        TextOverflow
                                            .ellipsis,

                                        style:
                                        const TextStyle(
                                          color: Color(
                                              0xffD17842),

                                          fontWeight:
                                          FontWeight
                                              .bold,

                                          fontSize: 16,
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        Provider.of<
                                            CartProvider>(
                                            context,
                                            listen:
                                            false)
                                            .addToCart(
                                            food);
                                      },

                                      child: Container(
                                        padding:
                                        const EdgeInsets
                                            .all(8),

                                        decoration:
                                        BoxDecoration(
                                          color:
                                          const Color(
                                              0xffD17842),

                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10),
                                        ),

                                        child: const Icon(
                                          Icons.add,
                                          color:
                                          Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}