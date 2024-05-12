import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class userprofile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return profileState();
  }
}

class profileState extends State<userprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile info',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 5, 116, 92),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Please provide your name and an optional profile photo',
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.5)),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 5, 116, 92),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 3, right: 3),
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 5, 116, 92))),
                          hintText: 'Type your name here',
                          hintStyle: TextStyle(fontSize: 15),
                          focusColor: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Color.fromARGB(255, 5, 116, 92),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          height: 50,
          width: 90,
          child: FloatingActionButton(
            onPressed: null,
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color.fromARGB(255, 5, 116, 92),
          )),
    );
  }
}
