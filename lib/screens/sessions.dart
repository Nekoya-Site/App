import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/session_box.dart';

class Sessions extends StatefulWidget {
  const Sessions({Key? key}) : super(key: key);

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1c1e),
      appBar: AppBar(
        title: const Text('Active Sessions'),
        centerTitle: true,
        backgroundColor: const Color(0xff212226),
      ),
      body: FutureBuilder<dynamic>(
        future: getSessions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return SessionBox(
                  icon: const Icon(Icons.key, color: Colors.white, size: 50,),
                  ip: data[index]['ip'].split(', ')[0],
                  userAgent: data[index]['user_agent'],
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
      )
    );
  }
}