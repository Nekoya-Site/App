import 'package:flutter/material.dart';
import 'package:nekoya_flutter/components/menu.dart';

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({Key? key}) : super(key: key);

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    'assets/images/AboutUs.gif',
                    height: 243,
                    width: 432,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 18, 18, 19)
                          .withOpacity(0.4),
                    ),
                    height: 243,
                    width: 432,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: const Text(
                    'About Us',
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 75),
                  child: const Text(
                    'Nekoya is your place for getting shoes for the entire family \nfrom many name brands. You’ll discover styles for ladies, men and children\n from brands like Nike, Converse, Vans, Skechers, ASICS and many more!\n Nekoya is a goal for the popular footwear brands you know and love.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 135),
                  child: const Text(
                    'Contact Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 185),
                  child: const Text(
                    'moe@chocola.dev',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
