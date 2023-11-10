import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_app/api/api.dart';
import 'package:nekoya_app/components/product_box.dart';
import 'package:nekoya_app/components/product_detail.dart';
import 'package:nekoya_app/utils/utils.dart'
    show kMobileBreakpoint, kTabletBreakpoint, kDesktopBreakPoint;

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  String selectedCategory = 'All';
  var currentData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Products'),
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
          key: UniqueKey(),
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> data = snapshot.data;

              List<String> categories = ['All'];
              var groupedCategories =
                  groupBy<dynamic, String>(data, (value) => value['BRAND']);
              groupedCategories.forEach((key, value) {
                categories.add(key);
              });

              if (selectedCategory == 'All') {
                currentData = data;
              }

              return Column(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            color: Color(0xff212226),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: DropdownButton(
                          isExpanded: true,
                          value: selectedCategory,
                          dropdownColor: const Color(0xff212226),
                          underline: const SizedBox(),
                          items: categories.map((value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Text(value,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600)));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue ?? 'All';
                              if (selectedCategory == 'All') {
                                currentData = data;
                              } else {
                                currentData =
                                    groupedCategories[selectedCategory] ?? [];
                              }
                            });
                          },
                        )),
                  ),
                  Expanded(
                    flex: 10,
                    child: GridView.count(
                      crossAxisCount: gridCount,
                      children: List.generate(currentData.length, (index) {
                        return ProductBox(
                          imageUrl:
                              "https://nekoya.moe.team/img/${data[index]['IMAGE']}",
                          title: currentData[index]['TITLE'],
                          discount: currentData[index]['DISCOUNT'],
                          fontSize: fontSize,
                          callback: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => productDetail(
                                  context, currentData[index]['ID']),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
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
