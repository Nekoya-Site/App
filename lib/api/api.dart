import 'package:dio/dio.dart';
import 'package:nekoya_flutter/api/config.dart';

Future<dynamic> getProducts() async {
  var req = await Dio().get(host + '/getproducts');
  var res = req.data;
  return res;
}

Future<dynamic> getProduct(id) async {
  var req = await Dio().get(host + '/getproduct', queryParameters: {'id': id});
  var res = req.data;
  return res;
}