import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    onGenerateRoute: Routes.onGenerateRoute,
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
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Image.asset("images/whatslight.png"),
        ),
        const SizedBox(height: 300),
        const Center(
          child: Text(
            "from",
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const Text("FACEBOOK",
            style: TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 28, 235, 35))),
      ],
    )));
  }
}
