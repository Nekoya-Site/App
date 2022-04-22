import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/screens/products.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Products(),
        debugShowCheckedModeBanner: false,
    );
  }
}