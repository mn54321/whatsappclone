import 'package:flutter/material.dart';
import 'package:whatsappclone/home.dart';
import 'package:whatsappclone/loginpage.dart';
import 'package:whatsappclone/userprofile.dart';
import 'package:whatsappclone/verifynumber.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String profile = 'profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (context) => home());

      case login:
        return MaterialPageRoute(builder: (context) => loginpage());

      case verification:
        final Map args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => Verifynumber(
                  smsCodeId: args['verficationId'],
                  phoneNumber: args['phone number'],
                ));

      case profile:
        return MaterialPageRoute(builder: (context) => userprofile());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('No Page Route Provided'),
                  ),
                ));
    }
  }
}
