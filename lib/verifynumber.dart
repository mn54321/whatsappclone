import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/controller/auth_controller.dart';
import 'package:whatsappclone/userprofile.dart';

class Verifynumber extends ConsumerWidget {
  const Verifynumber(
      {super.key, required this.smsCodeId, required this.phoneNumber});

  final String? smsCodeId;
  final String? phoneNumber;

  void verifysmsCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifySmscode(
        context: context,
        smsCodeId: smsCodeId ?? "",
        smsCode: smsCode,
        mounted: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    text: 'You have tried to register +447577668866.',
                    children: const [
                      TextSpan(
                          text:
                              'wait before requesting on SMS or call with your code.'),
                      TextSpan(
                          text: '              Wrong number?',
                          style: TextStyle(color: Colors.blue)),
                    ])),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  hintText: '- - -   - - -',
                  hintStyle: TextStyle(fontSize: 30)),
              onChanged: (value) {
                if (value.length == 6) {
                  return verifysmsCode(context, ref, value);
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter 6-digit code',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
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
                const SizedBox(
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
        ],
      ),
    );
  }
}
