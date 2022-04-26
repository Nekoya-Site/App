import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addToCart(productId) async {
  final prefs = await SharedPreferences.getInstance();

  var cart = jsonDecode(prefs.getString('cart') ?? '[]');
  var filteredCart = cart.where((x) => x["product_id"] == productId).toList();
  if (filteredCart.length == 0) {
    cart.add({
      "product_id": productId,
      "quantity": 1
    });
  } else {
    filteredCart[0]["quantity"]++;
    cart = cart.where((x) => x["product_id"] != productId).toList();
    cart.add(filteredCart[0]);
  }
  await prefs.setString('cart', jsonEncode(cart).toString());
}