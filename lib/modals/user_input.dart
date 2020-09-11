import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserInput extends StatefulWidget {
  final double latitude;
  final double longitude;

  UserInput(this.latitude, this.longitude);

  @override
  _UserInputState createState() => _UserInputState(latitude, longitude);
}

class _UserInputState extends State<UserInput> {
  final double latitude;
  final double longitude;

  _UserInputState(this.latitude, this.longitude);

  final _nameController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  @override
  void initState() {
    _latitudeController.text = "$latitude";
    _longitudeController.text = "$longitude";
    super.initState();
  }

  void _submitData() {
    final enteredName = _nameController.text;
    final enteredLatitude = _latitudeController.text;
    final enteredLongitude = _longitudeController.text;

    if (enteredName.isEmpty) {
      return;
    }

    if (_latitudeController.text.isEmpty) {
      return;
    }

    if (_longitudeController.text.isEmpty) {
      return;
    }

    print("////////////////////////////////");

    print("Name is: $enteredName");
    print("Latitude is: $enteredLatitude");
    print("Longitude is: $enteredLongitude");

    print("////////////////////////////////");

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Your Name'),
                controller: _nameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Latitude'),
                controller: _latitudeController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Longitude'),
                controller: _longitudeController,
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                child: Text('Print to Console'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white70,
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
