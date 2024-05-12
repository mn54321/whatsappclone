import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:whatsappclone/loginpage.dart';
import 'package:whatsappclone/routes/routes.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<home> {
  String slectedsnack = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                "images/circle.png",
                color: Color(0xFF00A884),
              ),
            ),
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Text(
              "Welcome to the Whatsapp",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Ro',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 24, 25)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Read out ',
                      style: TextStyle(color: Colors.grey, height: 1.5),
                      children: [
                        TextSpan(
                            text: 'Privacy Policy. ',
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(
                            text: 'Tap "Agree and continue" to accept the '),
                        TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: Colors.blue))
                      ])),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.1),
              ),
              height: 45,
              width: 150,
              child: TextButton(
                  onPressed: () {
                    showBottomSheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.language,
                        color: Color(0xFF00A884),
                      ),
                      Text(
                        '  $slectedsnack',
                        style: TextStyle(color: Color(0xFF00A884)),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFF00A884),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 190),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF00A884))),
                    onPressed: () => navigateToLoginPage(context),
                    child: Text(
                      "Agree and Continue",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ))
      ],
    ));
  }

  showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 4,
                    width: 30,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(
                        splashColor: Colors.transparent,
                        iconSize: 25,
                        constraints: BoxConstraints(minWidth: 40),
                        splashRadius: 22,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close)),
                  ),
                  Text(
                    "     App Language",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    height: 10,
                  )
                ],
              ),
              SizedBox(height: 10),
              Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.1),
              ),
              RadioListTile(
                title: Text('English'),
                subtitle: Text('(device language)'),
                value: 'English',
                selected: true,
                groupValue: slectedsnack,
                onChanged: (selectedvalue) {
                  setState(() {
                    slectedsnack = selectedvalue!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Hindi'),
                subtitle: Text('hindi'),
                value: 'Hindi',
                groupValue: slectedsnack,
                onChanged: (selectedvalue) {
                  setState(() => slectedsnack = selectedvalue!);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  navigateToLoginPage(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(routes.login, (route) => false);
  }
}
