// lib/screens/favorite_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hotel_app/ providers/cart_provider.dart';
import 'cart_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
    Provider.of<CartProvider>(context);

    return Scaffold(

      backgroundColor: const Color(0xff0C0F14),

      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,

        centerTitle: true,

        title: const Text(

          "Favorites ❤️",

          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          // CART BUTTON

          Stack(

            children: [

              IconButton(

                onPressed: () {

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const CartScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              if (provider.cartItems.isNotEmpty)

                Positioned(

                  right: 8,
                  top: 8,

                  child: Container(

                    padding:
                    const EdgeInsets.all(5),

                    decoration:
                    const BoxDecoration(

                      color:
                      Color(0xffD17842),

                      shape:
                      BoxShape.circle,
                    ),

                    child: Text(

                      provider.cartItems.length
                          .toString(),

                      style:
                      const TextStyle(

                        color: Colors.white,

                        fontSize: 11,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 10),
        ],
      ),

      body: provider.favoriteItems.isEmpty

          ? Center(

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: const [

            Icon(
              Icons.favorite_border,
              color: Colors.grey,
              size: 100,
            ),

            SizedBox(height: 20),

            Text(

              "No Favorites Added ☕",

              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )

          : GridView.builder(

        padding: const EdgeInsets.all(20),

        itemCount:
        provider.favoriteItems.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,

          crossAxisSpacing: 18,
          mainAxisSpacing: 18,

          childAspectRatio: 0.62,
        ),

        itemBuilder: (context, index) {

          final food =
          provider.favoriteItems[index];

          return Container(

            decoration: BoxDecoration(

              borderRadius:
              BorderRadius.circular(28),

              gradient:
              const LinearGradient(

                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

                colors: [

                  Color(0xff252A32),
                  Color(0xff141921),
                ],
              ),

              boxShadow: [

                BoxShadow(

                  color:
                  Colors.black.withOpacity(
                    0.4,
                  ),

                  blurRadius: 20,
                ),
              ],
            ),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                // IMAGE

                Stack(

                  children: [

                    ClipRRect(

                      borderRadius:
                      const BorderRadius
                          .vertical(

                        top:
                        Radius.circular(28),
                      ),

                      child: Image.network(

                        food.image,

                        height: 160,
                        width: double.infinity,

                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(

                      right: 10,
                      top: 10,

                      child: GestureDetector(

                        onTap: () {

                          provider.toggleFavorite(
                            food,
                          );
                        },

                        child: const CircleAvatar(

                          backgroundColor:
                          Colors.black54,

                          child: Icon(

                            Icons.favorite,

                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // DETAILS

                Padding(

                  padding:
                  const EdgeInsets.all(14),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(

                        food.name,

                        style:
                        const TextStyle(

                          color: Colors.white,

                          fontSize: 20,

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 6,
                      ),

                      Text(

                        food.description,

                        maxLines: 2,

                        style:
                        const TextStyle(

                          color: Colors.grey,

                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      Row(

                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                        children: [

                          Text(

                            "₹${food.price}",

                            style:
                            const TextStyle(

                              color:
                              Color(
                                0xffD17842,
                              ),

                              fontSize: 22,

                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          GestureDetector(

                            onTap: () {

                              provider.addToCart(
                                food,
                              );

                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(

                                SnackBar(

                                  backgroundColor:
                                  const Color(
                                    0xffD17842,
                                  ),

                                  content: Text(

                                    "${food.name} Added To Cart ☕",
                                  ),
                                ),
                              );
                            },

                            child: Container(

                              padding:
                              const EdgeInsets.all(
                                10,
                              ),

                              decoration:
                              BoxDecoration(

                                color:
                                const Color(
                                  0xffD17842,
                                ),

                                borderRadius:
                                BorderRadius.circular(
                                  15,
                                ),
                              ),

                              child: const Icon(

                                Icons.add,

                                color:
                                Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}