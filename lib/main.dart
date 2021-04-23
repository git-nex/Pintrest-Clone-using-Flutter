//Aayush Verma BT19CSE012

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'image_github.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pintrest Clone',
        theme: ThemeData(backgroundColor: Colors.red),
        home: Standard());
  }
}

// Reference link : https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_002_staggered_gridview/lib
//
class Standard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextButton(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.black12),
                  shape:
                      MaterialStateProperty.all<CircleBorder>(CircleBorder())),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    child:
                        Image.asset('images/pint.png', width: 35, height: 35)),
              ),
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 75.0, top: 15.0),
            child: Container(
                child: Row(
              children: [
                Container(
                  height: 48,
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))),
                    onPressed: () {},
                    child: Text(
                      'Home',
                      style: new TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ))),
                    onPressed: () {},
                    child: Text(
                      'Today',
                      style: new TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Container(
                    child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 230.0),
                    child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.search_sharp,
                                size: 25, color: Colors.black),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.black, fontStyle: FontStyle.italic),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 4),
                          ),
                        ),
                        style: TextStyle(color: Colors.black)),
                  ),
                ))
              ],
            )),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder())),
                onPressed: () {},
                child: Icon(
                  Icons.notifications,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.black12),
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder())),
                onPressed: () {},
                child: Icon(
                  Icons.message,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.black12),
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder())),
                onPressed: () {},
                child: Image.asset(
                  'images/cslogo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.black12),
                    shape: MaterialStateProperty.all<CircleBorder>(
                        CircleBorder())),
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 28,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: new PinterestGrid(),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageHover(
        imageData: imageList[index],
      ),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 18.0,
      crossAxisSpacing: 18.0,
    );
  }
}

class ImageHover extends StatefulWidget {
  const ImageHover({this.imageData});
  final ImageData imageData;
  @override
  Effect createState() => Effect();
}

class Effect extends State<ImageHover> {
  bool v1 = false;
  @override
  Widget build(context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: InkWell(
          onTap: () {},
          onHover: (value) {
            print(value);
            if (value) {
              setState(() {
                v1 = true;
              });
            } else {
              setState(() {
                v1 = false;
              });
            }
          },
          child: Stack(children: [
            Opacity(
              opacity: v1 ? 0.75 : 1,
              child: Image.asset(
                widget.imageData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Visibility(
                visible: v1,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    height: 40,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 8.0, bottom: 8),
                          child: Text("Save this",
                              style: new TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 90.0, top: 8.0, bottom: 8),
                          child: TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.black12),
                                shape: MaterialStateProperty.all<CircleBorder>(
                                    CircleBorder())),
                            onPressed: () {},
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 28,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Visibility(
                  visible: v1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30.0, left: 40, right: 30),
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: 160,
                          child: TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.black12),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ))),
                            onPressed: () {},
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.language,
                                    size: 35, color: Colors.black54),
                              ),
                              Text(
                                'Find Link',
                                style: new TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.black12),
                                shape: MaterialStateProperty.all<CircleBorder>(
                                    CircleBorder())),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(Icons.ios_share,
                                  size: 30, color: Colors.black54),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.black12),
                                shape: MaterialStateProperty.all<CircleBorder>(
                                    CircleBorder())),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.more_horiz,
                                size: 35,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ])),
    );
  }
}
