import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_app/api/api.dart';
import 'package:nekoya_app/data/cart.dart';
import 'package:nekoya_app/utils/utils.dart';

Widget makeDismissible({required context, required Widget child}) =>
    GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ));

Widget productDetail(context, id) {
  GlobalKey cartToolTipKey_ = GlobalKey();
  var selectedSize = 35;

  return StatefulBuilder(builder: (context, setState) {
    return makeDismissible(
        context: context,
        child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.5,
            maxChildSize: 0.965,
            builder: (_, controller) => FutureBuilder<dynamic>(
                future: getProduct(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    var discount = data[0]['DISCOUNT'];
                    if (discount != 0) {
                      discount = (100 - discount) / 100 * data[0]['PRICE'];
                    }

                    return Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff1b1c1e),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        padding: const EdgeInsets.all(16),
                        child: ScrollConfiguration(
                          behavior: HideScrollGlow(),
                          child: ListView(
                            controller: controller,
                            children: [
                              Center(
                                child: Text(
                                  data[0]['TITLE'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              CachedNetworkImage(
                                imageUrl:
                                    "https://nekoya.moe.team/img/${data[0]['IMAGE']}",
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                  color: Color(0xff8B0000),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        'assets/images/image_error.webp'),
                                fadeOutDuration:
                                    const Duration(milliseconds: 5),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  margin: const EdgeInsets.all(5.0),
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Text(
                                data[0]['DESCRIPTION'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    height: 2.0),
                              ),
                              DataTable(columns: const [
                                DataColumn(label: Text('')),
                                DataColumn(label: Text(''))
                              ], rows: [
                                DataRow(cells: [
                                  const DataCell(
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  DataCell(
                                    discount != 0
                                        ? Column(
                                            children: [
                                              Text(
                                                "Rp ${NumberFormat('#,##0.00', 'ID').format(discount)}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "Rp ${NumberFormat('#,##0.00', 'ID').format(data[0]['PRICE'])}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w100,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor: Colors.red,
                                                    decorationThickness: 3),
                                              )
                                            ],
                                          )
                                        : Text(
                                            "Rp ${NumberFormat('#,##0.00', 'ID').format(data[0]['PRICE'])}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                  )
                                ]),
                                DataRow(cells: [
                                  const DataCell(
                                    Text(
                                      "Stock",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      data[0]['STOCK'].toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ]),
                                DataRow(cells: [
                                  const DataCell(
                                    Text(
                                      "Size",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  DataCell(DropdownButton(
                                    value: selectedSize.toString(),
                                    dropdownColor: const Color(0xff212226),
                                    items: [
                                      '35',
                                      '36',
                                      '37',
                                      '38',
                                      '39',
                                      '40',
                                      '41',
                                      '42',
                                      '43',
                                      '44',
                                      '45'
                                    ].map((value) {
                                      return DropdownMenuItem(
                                          value: value,
                                          child: Text(value,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight:
                                                      FontWeight.w500)));
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedSize =
                                            int.parse(newValue ?? '35');
                                      });
                                    },
                                  ))
                                ])
                              ]),
                              const SizedBox(height: 30.0),
                              Tooltip(
                                key: cartToolTipKey_,
                                triggerMode: TooltipTriggerMode.manual,
                                showDuration: const Duration(seconds: 3),
                                waitDuration: const Duration(seconds: 3),
                                message: 'Successfully added to Cart ~',
                                padding: const EdgeInsets.all(30),
                                margin: const EdgeInsets.only(
                                    top: 30, left: 30, right: 30),
                                decoration: BoxDecoration(
                                    color: const Color(0xff212226),
                                    borderRadius: BorderRadius.circular(22)),
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      addToCart(id, selectedSize);
                                      final dynamic cartToolTip_ =
                                          cartToolTipKey_.currentState;
                                      cartToolTip_.ensureTooltipVisible();
                                    },
                                    icon: const Icon(Icons.add_shopping_cart),
                                    label: const Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff8B0000)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18.0))))),
                              )
                            ],
                          ),
                        ));
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff8B0000),
                    ),
                  );
                })));
  });
}
