import 'dart:convert';
import 'package:hive/hive.dart';

Future<void> addToCart(productId, size) async {
  final box = Hive.box();

  var cart = jsonDecode(box.get('cart', defaultValue: '[]'));
  var filteredCart = cart.where((x) => x["product_id"] == productId).toList();

  var selectedSize = [];

  if (filteredCart.length == 0) {
    selectedSize.add(size);
    cart.add({"product_id": productId, "quantity": 1, "size": selectedSize});
  } else {
    selectedSize = filteredCart[0]["size"];
    selectedSize.add(size);
    filteredCart[0]["size"] = selectedSize;
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
        filteredCart[0]["size"].removeLast();
        cart = cart.where((x) => x["product_id"] != productId).toList();
        cart.add(filteredCart[0]);
      }
    }
  }
  box.put('cart', jsonEncode(cart).toString());
}

Future<dynamic> clearCart() async {
  final box = Hive.box();

  box.put('cart', '[]');
}

Future<dynamic> viewCart() async {
  final box = Hive.box();

  var cart = jsonDecode(box.get('cart', defaultValue: '[]'));
  return cart;
}
