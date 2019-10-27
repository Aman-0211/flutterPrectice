import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../modals/imageModel.dart';
import '../widgets/imageList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    final response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchImage();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      appBar: AppBar(
        title: Text("First App"),
      ),
    );
  }
}
