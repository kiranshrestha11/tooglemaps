import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tooglemaps/model/space.dart';
import 'package:tooglemaps/providers/map_spaces.dart';
import 'package:tooglemaps/widgets/image_input.dart';

import 'package:provider/provider.dart';
import 'package:tooglemaps/widgets/space_input.dart';

class AddSpaceScreen extends StatefulWidget {
  static const String routeName = "/add_space";

  @override
  _AddSpaceScreenState createState() => _AddSpaceScreenState();
}

class _AddSpaceScreenState extends State<AddSpaceScreen> {
  File _pickedImage;
  TextEditingController _titleController = TextEditingController();
  SpaceLocation _pickedLocation;

  //saving a sapce
  void _saveSpace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<MapSpace>(context, listen: false)
        .addSpace(_titleController.text, _pickedImage, _pickedLocation);
    Navigator.of(context).pop();
  }

  void _selectedImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectSpace(double latitude, double longitude) {
    _pickedLocation = SpaceLocation(latitude: latitude, longitude: longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new space"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectedImage),
                  SizedBox(
                    height: 10,
                  ),
                  SpaceInput(_selectSpace),
                ],
              ),
            ),
          )),
          RaisedButton.icon(
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: Text(
              "Add Space",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _saveSpace,
          )
        ],
      ),
    );
  }
}
