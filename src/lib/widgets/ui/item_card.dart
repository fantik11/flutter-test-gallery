import 'package:flutter/material.dart';
import 'package:src/models/item_model.dart';
import 'package:src/widgets/screen/view.dart';

//TODO: Rename it to ItemCard
class ListCard extends StatelessWidget {
  const ListCard({Key key, this.model}) : super(key: key);

  final ItemModel model;

  void pushPhoto(BuildContext context)
  {
    Navigator.pushNamed(
      context,
      ViewPhoto.routeName,
      arguments: model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListTile(
          onTap: (){pushPhoto(context);},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Hero(
              tag: model.id,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/image_placeholder.png",
                image: model.regularImageUrl,
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
