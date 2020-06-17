import 'package:flutter/material.dart';
import 'package:src/models/photo_model.dart';

class ViewPhoto extends StatelessWidget {
  const ViewPhoto({Key key, @required this.model}) : super(key: key);
  static const routeName = "/photo";
  final PhotoModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title,
        ),
      ),
      body: Center(
        child: Hero(
          tag: model.id,
          child: FadeInImage.assetNetwork(
            placeholder: "assets/images/image_placeholder.png",
            image: model.regularImageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
