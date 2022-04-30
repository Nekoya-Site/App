import 'package:flutter/material.dart';

class SessionBox extends StatelessWidget {
  const SessionBox({Key? key, required this.icon, required this.ip, required this.userAgent}) : super(key: key);

  final Icon icon;
  final String ip;
  final String userAgent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xff212226),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: (){},
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: icon
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(ip, style: const TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600), textAlign: TextAlign.start,),
                      const SizedBox(height: 10.0,),
                      Text(userAgent, style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w300),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}