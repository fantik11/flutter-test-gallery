import 'package:flutter/material.dart';
import 'ui/screen/gallery.dart';
import 'ui/screen/view_photo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/gallery",
      routes: {
        Gallery.routeName: (context) => Gallery(),
        ViewPhoto.routeName: (context) => ViewPhoto(),
      },
    );
  }
}
