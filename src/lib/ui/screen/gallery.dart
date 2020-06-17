import 'package:flutter/material.dart';
import 'package:src/ui/components/item_scroller.dart';

class Gallery extends StatelessWidget {
  Gallery({Key key}) : super(key: key);
  static const routeName = "/gallery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gallery screen",
        ),
      ),
      body: Scroller(),
    );
  }
}
