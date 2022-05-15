import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import '../utils/utils.dart';
import 'product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular",
            pressSeeAll: () {},
          ),
        ),
        FutureBuilder<dynamic>(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var sourceData = snapshot.data;
              sourceData.shuffle();
              var data = sourceData.take(6).toList();
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                        title: data[index]['TITLE'],
                        imageUrl: "https://nekoya.moe.team/img/${data[index]['IMAGE']}",
                        price: 99,
                        bgColor: const Color(0xFFFEFBF9),
                        press: () {},
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                        title: 'Loading...',
                        imageUrl: "https://i.ibb.co/QJFLZC4/La-Darknesss-Portrait.webp",
                        price: 99,
                        bgColor: const Color(0xFFFEFBF9),
                        press: () {},
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        )
      ],
    );
  }
}
