import 'package:flutter/material.dart';
import 'package:src/providers/photo_api_provider.dart';
import 'package:src/models/photo_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:src/ui/components/item_card.dart';

class Scroller extends StatefulWidget {
  Scroller({Key key}) : super(key: key);

  @override
  _ScrollerState createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  List<PhotoModel> _items = [];
  ScrollController _scrollController = new ScrollController();
  int _page = 1;
  final Future<ResultModel> loadingFuture =
      PhotoApiProvider.fetchPhotos(page: 1);

  @override
  void initState() {
    loadingFuture.then((value) => _items.addAll(value.items));
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _loadMorePhotos();
    }
  }

  void _loadMorePhotos() {
    _page++;
    PhotoApiProvider.fetchPhotos(page: _page).then((value) {
      setState(() {
        _items.addAll(value.items);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: loadingFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(
                  model: _items[index],
                );
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
