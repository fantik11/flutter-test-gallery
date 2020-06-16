import 'package:flutter/material.dart';
import 'package:src/models/item_model.dart';

class ViewPhoto extends StatelessWidget {
  const ViewPhoto({Key key}) : super(key: key);
  static const routeName = "/photo";

  @override
  Widget build(BuildContext context) {
    final ItemModel args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
        ),
      ),
      body: Center(
        child: Hero(
          tag: args.id,
          child: Image.network(
            args.regularImageUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
