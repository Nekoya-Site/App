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

Future<dynamic> RegisterPost({email, password, first_name, last_name}) async {
  Response req = await Dio().post(
    (host + '/register'),
    data: {
      'email': email,
      'password': password,
      'first_name': first_name,
      'last_name': last_name
    },
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );
  return req.statusCode;
}
