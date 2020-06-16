import 'package:flutter/material.dart';
import 'package:src/widgets/ui/photo_scroller.dart';

class Gallery extends StatefulWidget {
  Gallery({Key key, this.title}) : super(key: key);
  static const routeName = "/gallery";

  final String title;

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Scroller(),
    );
  }
}
