import 'package:flutter/material.dart';

import 'package:nekoya_flutter/api/api.dart';
import 'package:nekoya_flutter/components/session_box.dart';
import 'package:nekoya_flutter/data/auth.dart';

class Sessions extends StatefulWidget {
  const Sessions({Key? key}) : super(key: key);

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  Future<dynamic> loadSessions() async {
    var session = await getSession();
    var data = await getSessions(session);
    return data;
  }

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
        future: loadSessions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var listSessions = snapshot.data;
            return ListView.builder(
              itemCount: listSessions['data']!.length,
              itemBuilder: (context, index) {
                return SessionBox(
                  icon: const Icon(Icons.key, color: Colors.white, size: 50,),
                  ip: listSessions['data'][index]['ip'].split(', ')[0],
                  userAgent: listSessions['data'][index]['user_agent'],
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