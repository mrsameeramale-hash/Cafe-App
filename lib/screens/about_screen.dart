import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0C0F14),

      appBar: AppBar(
        backgroundColor: const Color(0xff141921),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "About Cafe",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ☕ CAFE IMAGE
            Container(
              height: 260,
              width: double.infinity,

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 🔥 CONTENT
            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // TITLE
                  const Text(
                    "Sammyy's Cafe ☕",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // SUBTITLE
                  const Text(
                    "Where every sip feels special ❤️",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ABOUT CARD
                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: const Color(0xff141921),
                      borderRadius: BorderRadius.circular(22),
                    ),

                    child: const Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Row(
                          children: [

                            Icon(
                              Icons.coffee,
                              color: Color(0xffD17842),
                            ),

                            SizedBox(width: 10),

                            Text(
                              "About Us",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        Text(
                          "Welcome to Sammyy's Cafe, your perfect destination for premium coffee, delicious desserts, pizzas, burgers and tasty snacks.\n\nWe believe every customer deserves fresh flavors, cozy vibes and unforgettable taste. Our cafe is specially designed for coffee lovers and foodies who enjoy quality and comfort together.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ✨ FEATURES
                  const Text(
                    "Why Choose Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  buildFeature(
                    Icons.local_cafe,
                    "Premium Coffee",
                    "Freshly brewed coffee with rich taste.",
                  ),

                  buildFeature(
                    Icons.fastfood,
                    "Delicious Food",
                    "Burgers, pizzas, desserts and more.",
                  ),

                  buildFeature(
                    Icons.delivery_dining,
                    "Fast Delivery",
                    "Quick and reliable food delivery.",
                  ),

                  buildFeature(
                    Icons.favorite,
                    "Made With Love",
                    "Prepared with hygiene and care.",
                  ),

                  const SizedBox(height: 30),

                  // 📍 CONTACT CARD
                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: const Color(0xff141921),
                      borderRadius: BorderRadius.circular(22),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Contact Information",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        contactRow(
                          Icons.location_on,
                          "Chhatrapati Sambhaji Nagar",
                        ),

                        contactRow(
                          Icons.phone,
                          "+91 76200 87828",
                        ),

                        contactRow(
                          Icons.email,
                          "sammyycafe@gmail.com",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 FEATURE TILE
  Widget buildFeature(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xff141921),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color:
              const Color(0xffD17842).withOpacity(0.2),

              borderRadius: BorderRadius.circular(14),
            ),

            child: Icon(
              icon,
              color: const Color(0xffD17842),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📞 CONTACT ROW
  Widget contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: Row(
        children: [

          Icon(
            icon,
            color: const Color(0xffD17842),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}