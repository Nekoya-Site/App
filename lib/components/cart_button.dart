import 'package:flutter/material.dart';

class CartButton extends StatefulWidget {
  const CartButton({Key? key, required this.icon, required this.text1, required this.text2, required this.refer}) : super(key: key);

  final Icon icon;
  final String text1;
  final String text2;
  final Function() refer;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: FloatingActionButton.extended(
        onPressed: (){
          widget.refer();
        },
        icon: widget.icon,
        label: Row(
          children: [
            Text(widget.text1),
            const SizedBox(width: 90,),
            Text(widget.text2)
          ],
        )
      )
    );
  }
}