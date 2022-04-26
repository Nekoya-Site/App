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

Future<dynamic> registerPost(data) async {
  Response req = await Dio().post(
    (host + '/register'),
    data: data,
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );
  return req.statusCode;
}

Future<dynamic> loginPost({email, password}) async {
  Response req = await Dio().post(
    (host + '/login'),
    data: {
      'email': email,
      'password': password,
    },
    options: Options(
      contentType: Headers.formUrlEncodedContentType,
      validateStatus: (status) {
        return status! < 400;
      },
    ),
  );
  return req.statusCode;
}
