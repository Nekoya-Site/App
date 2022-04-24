import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Nekoya'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: Text('Register'),
    );
  }
}



// Card(
//             color: const Color(0xff212226),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: InkWell(
//               onTap: () {
//                 print("Card tapped");
//               },
//               borderRadius: BorderRadius.circular(10),
//               splashColor: const Color(0xff8B0000),
//               highlightColor: const Color(0xff8B0000),
//               child: Container(
//                 child: Text("tes", style: TextStyle(color: Colors.white)),
//                 padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//               ),
//             ),
//           ),