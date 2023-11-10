import 'package:flutter/material.dart';

import 'package:nekoya_app/api/api.dart';
import 'package:nekoya_app/components/product_box.dart';
import 'package:nekoya_app/components/product_detail.dart';
import 'package:nekoya_app/utils/utils.dart'
    show kMobileBreakpoint, kTabletBreakpoint, kDesktopBreakPoint;

class Discounts extends StatefulWidget {
  const Discounts({Key? key}) : super(key: key);

  @override
  State<Discounts> createState() => _DiscountsState();
}

class _DiscountsState extends State<Discounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Discounts'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(builder: (context, dimension) {
        int gridCount = 2;
        double fontSize = 14.0;

        if (dimension.maxWidth <= kMobileBreakpoint) {
          gridCount = 2;
          fontSize = 14.0;
        } else if (dimension.maxWidth > kMobileBreakpoint &&
            dimension.maxWidth <= kTabletBreakpoint) {
          gridCount = 4;
          fontSize = 15.0;
        } else if (dimension.maxWidth > kTabletBreakpoint &&
            dimension.maxWidth <= kDesktopBreakPoint) {
          gridCount = 5;
          fontSize = 10.0;
        } else {
          gridCount = 6;
          fontSize = 10.0;
        }

        return FutureBuilder<dynamic>(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> data = snapshot.data;

              List<dynamic> currentData = [];
              for (var product in data) {
                if (product['DISCOUNT'] != 0) {
                  currentData.add(product);
                }
              }

              return GridView.count(
                crossAxisCount: gridCount,
                children: List.generate(currentData.length, (index) {
                  return ProductBox(
                    imageUrl:
                        "https://nekoya.moe.team/img/${currentData[index]['IMAGE']}",
                    title: currentData[index]['TITLE'],
                    discount: currentData[index]['DISCOUNT'],
                    fontSize: fontSize,
                    callback: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) =>
                            productDetail(context, currentData[index]['ID']),
                      );
                    },
                  );
                }),
              );
            }

            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff8B0000),
              ),
            );
          },
        );
      }),
    );
  }
}
