import 'dart:io';
import 'dart:typed_data';

import 'package:dialog_alert/dialog_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsappclone/image_picker_page.dart';
import 'package:whatsappclone/short_h_bar.dart';

class userprofile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return userprofileState();
  }
}

class userprofileState extends State<userprofile> {
  File? imagecamera;
  Uint8List? imageGallery;
  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShortHBar(),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Profile Photo',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  height: 31,
                  width: 31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 15,
                      )),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            Divider(
              height: 20,
              color: Colors.grey.withOpacity(0.2),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 5, 116, 92)
                            .withOpacity(0.9),
                        radius: 20,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: pickImageFromCamera,
                          icon: const Icon(
                            Icons.camera,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Camera'),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 5, 116, 92)
                            .withOpacity(0.9),
                        radius: 20,
                        child: IconButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            final image = await Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => ImagePickerPage(),
                            ));
                            if (image == null) return;
                            setState(() {
                              imagecamera = null;
                              imageGallery = image;
                            });
                          },
                          color: Colors.white,
                          icon: const Icon(Icons.photo),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Gallary')
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }

  pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          imagecamera = File(image.path);
          imageGallery = null;
          Navigator.pop(context);
        });
      }
    } catch (e) {
      showDialogAlert(
          context: context,
          title: "Error",
          message: e.toString(),
          actionButtonTitle: "ok");
    }
  }

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
            GestureDetector(
              onTap: imagePickerTypeBottomSheet,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 5, 116, 92),
                    border: Border.all(
                        color: imagecamera == null && imageGallery == null
                            ? Colors.transparent
                            : Colors.grey.withOpacity(0.4)),
                    image: imagecamera != null || imageGallery != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: imageGallery != null
                                ? MemoryImage(imageGallery!) as ImageProvider
                                : FileImage(imagecamera!))
                        : null),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 3),
                  child: Icon(
                    Icons.add_a_photo,
                    color: imagecamera == null && imageGallery == null
                        ? Colors.white
                        : Colors.transparent,
                    size: 30,
                  ),
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
