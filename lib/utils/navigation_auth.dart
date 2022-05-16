import 'package:flutter/material.dart';

import 'package:nekoya_flutter/data/auth.dart';
import 'package:nekoya_flutter/screens/login.dart';

class NavigationAuth extends StatelessWidget {
  const NavigationAuth({Key? key, required this.route}) : super(key: key);

  final Widget route;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<dynamic>(
      future: checkSessionExist(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          if (data) {
            return route;
          } else {
            return const Login();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff8B0000),
            ),
          );
        }
      }
    );
  }
}