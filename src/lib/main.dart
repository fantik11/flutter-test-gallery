import 'package:flutter/material.dart';
import 'ui/screen/gallery.dart';
import 'ui/screen/view_photo.dart';
import 'package:src/models/photo_model.dart';

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
      initialRoute: Gallery.routeName,
      routes: {
        Gallery.routeName: (context) => Gallery(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ViewPhoto.routeName) {
          final PhotoModel args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return ViewPhoto(
                model: args,
              );
            },
          );
        }
      },
    );
  }
}
