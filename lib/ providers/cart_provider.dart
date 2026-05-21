import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  List<Map<String, dynamic>> cartItems = [];
  List favoriteItems = [];

  /// ================= CART =================

  void addToCart(food) {
    int index = cartItems.indexWhere(
          (item) => item['food'].name == food.name,
    );

    if (index >= 0) {
      cartItems[index]['quantity']++;
    } else {
      cartItems.add({
        'food': food,
        'quantity': 1,
      });
    }

    notifyListeners();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    cartItems[index]['quantity']++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
    } else {
      cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  /// ================= TOTAL PRICE =================

  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item['food'].price * item['quantity'];
    }
    return total;
  }

  /// ✅ FIXED: CART COUNT
  int get totalItems {
    int total = 0;
    for (var item in cartItems) {
      total += item['quantity'] as int;
    }
    return total;
  }

  /// alias (optional)
  int get cartCount => totalItems;

  /// ================= FAVORITES =================

  void toggleFavorite(food) {
    if (favoriteItems.contains(food)) {
      favoriteItems.remove(food);
    } else {
      favoriteItems.add(food);
    }
    notifyListeners();
  }

  bool isFavorite(food) {
    return favoriteItems.contains(food);
  }
}