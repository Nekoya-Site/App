import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

import 'package:nekoya_app/data/auth.dart';
import 'package:nekoya_app/screens/login.dart';

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
              html.window.history.pushState(null, '', '/#/login');
              return const Login();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff8B0000),
              ),
            );
          }
        });
  }
}
