import 'package:flutter/material.dart';
import 'package:src/models/item_model.dart';
import 'package:src/ui/screen/view_photo.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key key, this.model}) : super(key: key);

  final ItemModel model;
  

  void pushPhoto(BuildContext context) {
    Navigator.pushNamed(
      context,
      ViewPhoto.routeName,
      arguments: model,
    );
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.network(model.regularImageUrl).image, context);
    return Card(
      child: Container(
        child: ListTile(
          onTap: () {
            pushPhoto(context);
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Hero(
              tag: model.id,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/image_placeholder.png",
                image: model.thumbImageUrl,
                fit: BoxFit.cover,
                width: 100,
                height: 60,
              ),
            ),
          ),
          title: Text(
            model.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          subtitle: Text(
            "Posted by: " + model.user,
          ),
        ),
      ),
    );
  }
}
