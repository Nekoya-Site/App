import 'dart:convert';
import 'package:hive/hive.dart';

Future<void> addToCart(productId) async {
  final box = Hive.box();

  var cart = jsonDecode(box.get('cart', defaultValue: '[]'));
  var filteredCart = cart.where((x) => x["product_id"] == productId).toList();
  if (filteredCart.length == 0) {
    cart.add({"product_id": productId, "quantity": 1});
  } else {
    filteredCart[0]["quantity"]++;
    cart = cart.where((x) => x["product_id"] != productId).toList();
    cart.add(filteredCart[0]);
  }
  box.put('cart', jsonEncode(cart).toString());
}

Future<void> removeFromCart(productId, bool batch) async {
  final box = Hive.box();

  var cart = jsonDecode(box.get('cart', defaultValue: '[]'));
  var filteredCart = cart.where((x) => x["product_id"] == productId).toList();
  if (filteredCart.length > 0) {
    if (batch) {
      cart = cart.where((x) => x["product_id"] != productId).toList();
    } else {
      filteredCart[0]["quantity"]--;
      if (filteredCart[0]["quantity"] == 0) {
        cart = cart.where((x) => x["product_id"] != productId).toList();
      } else {
        cart = cart.where((x) => x["product_id"] != productId).toList();
        cart.add(filteredCart[0]);
      }
    }
  }
  box.put('cart', jsonEncode(cart).toString());
}

Future<dynamic> viewCart() async {
  final box = Hive.box();

  var cart = jsonDecode(box.get('cart', defaultValue: '[]'));
  return cart;
}
