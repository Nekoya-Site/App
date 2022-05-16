import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nekoya_flutter/utils/utils.dart';

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
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: SvgPicture.asset(
                            "assets/icons/email.svg",
                            color: Colors.white,
                            width: 21.5,
                            height: 21.5,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2),
                          child: SizedBox(
                            width: 100,
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xff8B0000),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  )),
                              onPressed: () {},
                              child: const Text(
                                'SUBSCRIBE',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                        )),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
