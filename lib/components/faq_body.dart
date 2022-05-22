import 'package:flutter/material.dart';

class FAQBody extends StatefulWidget {
  const FAQBody({Key? key}) : super(key: key);

  @override
  State<FAQBody> createState() => _FAQBodyState();
}

class _FAQBodyState extends State<FAQBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('Do you ship to my country?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'We ship to nearly 200 countries worldwide.'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('How long does shipping take? When will I receive my order?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'Please note, we require 1-5 days to process orders. We strive to ship all items on-time, however, in rare cases, it can take longer than 3 months. Any orders not received within 8 weeks automatically qualify for a full-refund or reship free of charge! 🌟'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('My order has been dispatched, can I track it?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'Once your order has been shipped, you’ll receive a tracking number via email. Note, it can take up to 7 days for shipping activity to update.'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('Do you offer a guarantee? Can I return my items?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'Of course. We offer an extended 30 day guarantee! ☑️'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('Can I change or cancel my order?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'Sure! You can cancel, or change your order within 24 hours of confirmation.'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('What methods of payment do you take?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'We accept ALL major bank methods.'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('Do you offer promotional or affiliate opportunities?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'We do and we’d love to hear from you! 👋'),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const ExpansionTile(
                backgroundColor: Color(0xff212226),
                collapsedBackgroundColor: Color.fromARGB(255, 18, 19, 19),
                textColor: Color.fromARGB(255, 252, 252, 252),
                collapsedTextColor: Color.fromARGB(255, 252, 252, 252),
                title: Text('Do I need to pay import duties?'),
                children: [
                  ListTile(
                    textColor: Colors.white,
                    title: Text(
                        'Some packages may be subject to import duties depending on the country of receipt.'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}