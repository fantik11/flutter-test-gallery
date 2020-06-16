import 'package:flutter/material.dart';
import 'package:src/providers/photo_api_provider.dart';
import 'package:src/models/item_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:src/widgets/ui/item_card.dart';

class Scroller extends StatefulWidget {
  Scroller({Key key}) : super(key: key);

  @override
  _ScrollerState createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  List<ItemModel> _items = [];
  final Future<ResultModel> loadingFuture = PhotoApiProvider.fetchPhotos();

  @override
  void initState() {
    loadingFuture.then((value) => _items.addAll(value.items));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: loadingFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListCard(model: _items[index],);
              },
              itemCount: _items.length,
            );
          } else {
            return Center(
              child: SpinKitHourGlass(
                color: Theme.of(context).accentColor,
                size: 50.0,
              ),
            );
          }
        },
      ),
    );
  }
}
