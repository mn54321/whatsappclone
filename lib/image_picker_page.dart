import 'dart:ffi';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImagePickerPageState();
  }
}

class ImagePickerPageState extends State<ImagePickerPage> {
  List<Widget> imageList = [];
  int currentPage = 0;
  int? lastPage;
  handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent <= .33) return;
    if (currentPage == lastPage) return;
    fetchAllImages();
  }

  fetchAllImages() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return PhotoManager.openSetting();

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image, onlyAll: true);

    List<AssetEntity> photos =
        await albums[0].getAssetListPaged(page: currentPage, size: 24);
    List<Widget> temp = [];

    for (var asset in photos) {
      temp.add(FutureBuilder(
        future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () => Navigator.pop(context, snapshot.data),
                borderRadius: BorderRadius.circular(5),
                splashFactory: NoSplash.splashFactory,
                child: Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 1),
                      image: DecorationImage(
                          image: MemoryImage(snapshot.data as Uint8List),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ));
    }
    setState(() {
      imageList.addAll(temp);
      currentPage++;
    });
  }

  @override
  void initState() {
    fetchAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            'Whatsapp',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        actions: [
          PopupMenuButton(
            offset: Offset(0, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('new')),
              PopupMenuItem(child: Text('help'))
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scroll) {
            handleScrollEvent(scroll);
            return true;
          },
          child: GridView.builder(
              itemCount: imageList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (_, Index) {
                return imageList[Index];
              }),
        ),
      ),
    );
  }
}
