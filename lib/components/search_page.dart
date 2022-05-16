import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/product_detail.dart';
import 'package:nekoya_flutter/components/search_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: Text("Search Result of ${widget.query}"),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: FutureBuilder<dynamic>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            var filteredData = data.where((x) => x['TITLE'].toLowerCase().contains(widget.query.toLowerCase()) ? true : false).toList();
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return SearchItem(
                  title: filteredData[index]['TITLE'],
                  description: "Price : Rp ${NumberFormat('#,##0.00', 'ID').format(filteredData[index]['PRICE'])}",
                  imageUrl: "https://nekoya.moe.team/img/${filteredData[index]['IMAGE']}",
                  callback: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => productDetail(context, filteredData[index]['ID']),
                    );
                  },
                );
              }
            );
          }
          
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff8B0000),
            ),
          );
        }
      ),
    );
  }
}