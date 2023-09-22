import 'package:flutter/material.dart';

import 'package:nekoya_app/api/api.dart';
import 'package:nekoya_app/components/product_detail.dart';
import 'package:nekoya_app/components/product_card.dart';
import 'package:nekoya_app/components/section_title.dart';
import 'package:nekoya_app/utils/utils.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
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
                          imageUrl:
                              "https://nekoya.moe.team/img/${data[index]['IMAGE']}",
                          bgColor: const Color(0xFFFEFBF9),
                          press: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) =>
                                  productDetail(context, data[index]['ID']),
                            );
                          },
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
                          imageUrl:
                              "https://i.ibb.co/QJFLZC4/La-Darknesss-Portrait.webp",
                          bgColor: const Color(0xFFFEFBF9),
                          press: () {},
                        ),
                      ),
                    ),
                  ),
                );
              }
            })
      ],
    );
  }
}
