import 'package:flutter/material.dart';

import 'package:nekoya_app/components/bannerimage.dart';
import 'package:nekoya_app/components/carousel.dart';
import 'package:nekoya_app/components/new_arrival_products.dart';
import 'package:nekoya_app/components/newsletter.dart';
import 'package:nekoya_app/components/popular_products.dart';
import 'package:nekoya_app/components/search_form.dart';
import 'package:nekoya_app/screens/about_us.dart';
import 'package:nekoya_app/screens/faq.dart';
import 'package:nekoya_app/utils/utils.dart';

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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.question_mark),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const FAQ()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutUs()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const Text(
                "Best Looking Sneakers For You...",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: SearchForm(),
              ),
              const Carousel(),
              const NewArrivalProducts(),
              const SizedBox(
                height: 15,
              ),
              const Bannerimage(),
              const PopularProducts(),
              const Newsletter(),
            ],
          ),
        ),
      ),
    );
  }
}
