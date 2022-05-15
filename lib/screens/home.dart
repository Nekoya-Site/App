import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nekoya_flutter/components/carouselwithindicatordemo.dart';
import 'package:nekoya_flutter/utils/utils.dart';

import 'package:nekoya_flutter/components/categories.dart';
import 'package:nekoya_flutter/components/new_arrival_products.dart';
import 'package:nekoya_flutter/components/popular_products.dart';
import 'package:nekoya_flutter/components/search_form.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Nekoya'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const Text(
              "best Outfits for you",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            const Categories(),
            CarouselWithIndicatorDemo(),
            const NewArrivalProducts(),
            const PopularProducts(),
          ],
        ),
      ),
    );
  }
}
