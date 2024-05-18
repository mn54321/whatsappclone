// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/controller/auth_controller.dart';
import 'package:whatsappclone/verifynumber.dart';

class loginpage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return loginpageState();
  }
}

class loginpageState extends ConsumerState<loginpage> {
  //var _textfield = GlobalKey<FormState>();
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberrController;
  @override
  void initState() {
    countryNameController = TextEditingController(text: 'India');
    countryCodeController = TextEditingController(text: '91');
    phoneNumberrController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    countryNameController.dispose();
    phoneNumberrController.dispose();
    super.dispose();
  }

  sendsms() {
    final phoneNumber = phoneNumberrController.text;
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;

    if (phoneNumber.isEmpty) {
      return showdia();
    }

    if (phoneNumber.length < 9) {
      return alert();
    }
    ref.read(authControllerProvider).sendSmsCode(
        context: context, phoneNumber: ' +$countryCode$phoneNumber');
  }

  showCountrycodepicker() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        favorite: ['+91'],
        countryListTheme: CountryListThemeData(
          bottomSheetHeight: 800,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flagSize: 22,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          textStyle: TextStyle(color: Color.fromARGB(255, 5, 116, 92)),
          inputDecoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.language,
                color: Color.fromARGB(255, 5, 116, 92),
              ),
              hintText: 'search country or name',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 5, 116, 92)))),
        ),
        onSelect: (Country) {
          countryCodeController.text = Country.phoneCode;
          countryNameController.text = Country.name;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('           Enter your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        ),
        actions: [
          Row(
            children: [
              PopupMenuButton(
                  offset: Offset(0, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  itemBuilder: (context) => [
                        PopupMenuItem(child: Text('Link as companion device')),
                        PopupMenuItem(child: Text("Help"))
                      ])
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      color: const Color.fromARGB(255, 89, 87, 87),
                      height: 1.5,
                      fontSize: 15),
                  text: ' WhatsApp will need to verify your number.',
                  children: [
                    TextSpan(text: ' Carrier charges may apply.'),
                    TextSpan(
                        text: ' Whats my number?',
                        style:
                            TextStyle(color: Color.fromARGB(255, 5, 116, 92)))
                  ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 116, 92), width: 2)),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 5, 116, 92))),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              controller: countryNameController,
              readOnly: true,
              onTap: showCountrycodepicker,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              children: [
                Container(
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.add,
                            size: 15,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 5, 116, 92),
                                  width: 2)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 5, 116, 92),
                                  width: 2))),
                      onTap: showCountrycodepicker,
                      controller: countryCodeController,
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    child: TextFormField(
                      /* validator: (value) {
                        if (value == null || value.isEmpty) {
                          return showdia();
                        }

                        if (value.length < 10) {
                          return alert();
                        }
                      },*/
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 5, 116, 92),
                                  width: 2)),
                          hintStyle: TextStyle(
                            fontSize: 13,
                          ),
                          hintText: 'phone number',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 5, 116, 92)))),
                      onTap: null,
                      controller: phoneNumberrController,
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 100,
        height: 40,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 5, 116, 92),
          onPressed: () {
            // _textfield.currentState!.validate();
            sendsms();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => verifynumber(
            //               smsCodeId: '',
            //               phoneNumber: '',
            //             )));
          },
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  showdia() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 5, 116, 92))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ok',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
              content: Text(
                'Plz enter your phone number',
                style: TextStyle(fontSize: 15),
              ));
        });
  }

  alert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 5, 116, 92))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ok',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
              content: Text(
                'The phone number you entered is too short for the country',
                style: TextStyle(fontSize: 15),
              ));
        });
  }
}
