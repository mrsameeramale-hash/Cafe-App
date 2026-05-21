import 'package:flutter/material.dart';
import 'package:hotel_app/ models/food.dart';

class DetailsScreen extends StatelessWidget {

  final Food food;

  const DetailsScreen({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2D201C),
        title: Text(food.name),
      ),

      body: Column(
        children: [

          Image.network(
            food.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  food.name,

                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  food.description,
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 20),

                Text(
                  "₹${food.price}",

                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
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