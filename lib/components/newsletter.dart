import 'package:flutter/material.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class Newsletter extends StatelessWidget {
  const Newsletter({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 25.0, left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Newsletter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Subscribe to Our Newsletter and get 20% off your first purchase',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff212226),
                      hintText: "Input Your Email",
                      hintStyle: const TextStyle(color: Colors.white),
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      errorBorder: outlineInputBorder,
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
