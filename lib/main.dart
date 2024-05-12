import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/firebase_options.dart';
import 'package:whatsappclone/home.dart';
import 'package:whatsappclone/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Whatsapp Clone",
    home: whatsapp(),
    onGenerateRoute: routes.onGenerateRoute,
  )));
}

class whatsapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return whatsappState();
  }
}

class whatsappState extends State<whatsapp> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var _mediaquery = MediaQuery.of(context);
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          child: Image.asset("images/whatslight.png"),
        ),
        SizedBox(height: 300),
        Center(
          child: Text(
            "from",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text("FACEBOOK",
            style: TextStyle(
                fontSize: 12, color: const Color.fromARGB(255, 28, 235, 35))),
      ],
    )));
  }
}
