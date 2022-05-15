import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/utils.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onSaved: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff212226),
          hintText: "Search items...",
          hintStyle: TextStyle(color: Colors.white),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset("assets/icons/Search.svg",
                color: Colors.white),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            child: SizedBox(
              width: 100,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff8B0000),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {},
                child: const Text('Search'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
