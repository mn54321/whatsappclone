import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappclone/userprofile.dart';

class verifynumber extends StatefulWidget {
  final String smsCodeId;
  final String phoneNumber;
  verifynumber({super.key, required this.smsCodeId, required this.phoneNumber});
  @override
  State<StatefulWidget> createState() {
    return verifynumberState();
  }
}

class verifynumberState extends State<verifynumber> {
  late TextEditingController codeController;

  @override
  void initState() {
    codeController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            '     Verify your number',
            style: TextStyle(
                color: Color.fromARGB(255, 5, 116, 92),
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ),
        actions: [
          Row(
            children: [
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                offset: Offset(0, 50),
                itemBuilder: (context) => [PopupMenuItem(child: Text('help'))],
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), height: 1.5),
                    text: 'You have tried to register +447767945663.',
                    children: [
                      TextSpan(
                          text:
                              'wait before requesting on SMS or call with your code.'),
                      TextSpan(
                          text: '              Wrong number?',
                          style: TextStyle(color: Colors.blue)),
                    ])),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextFormField(
              controller: codeController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: '- - -   - - -',
                  hintStyle: TextStyle(fontSize: 30)),
              onTap: () {
                null;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Enter 6-digit code',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.message,
                  color: Colors.black.withOpacity(0.7),
                ),
                Text(
                  'Resend SMS',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.black.withOpacity(0.6),
                ),
                Text(
                  'Call me',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                )
              ],
            ),
          ),
          Divider(height: 30),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => userprofile()));
              },
              child: Text('next'))
        ],
      ),
    );
  }
}
