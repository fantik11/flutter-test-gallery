import 'package:flutter/material.dart';
import 'package:src/models/item_model.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key key, this.model}) : super(key: key);

  final ItemModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Hero(
              tag: model.id,
              child: Image.network(
                model.thumbImageUrl,
                fit: BoxFit.cover,
                width: 100,
                height: 60,
              ),
            ),
          ),
          title: Text(
            model.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text("Posted by: " + model.user),
        ),
      ),
    );
  }
}
